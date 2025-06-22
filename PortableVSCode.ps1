#Requires -RunAsAdministrator
#Requires -Version 7.0

[CmdletBinding()]
param (
  [Parameter(ParameterSetName = "Setup")]
  [switch]$Setup,

  [Parameter(ParameterSetName = "Upgrade")]
  [switch]$Upgrade,

  [Parameter(Mandatory = $true)]
  [string]$Path
)

$Path = $Path.TrimEnd('\','/')

function Expand-FromZip {
  param (
    [Parameter(Mandatory = $true)]
    [string]$ZipPath,

    [Parameter(Mandatory = $true)]
    [string]$ExtractPath
  )

  Add-Type -AssemblyName System.IO.Compression.FileSystem

  Invoke-WebRequest -Uri $downloadUrl -OutFile $ZipPath
  [System.IO.Compression.ZipFile]::ExtractToDirectory($ZipPath, $ExtractPath, $true)
  Remove-Item -Path $ZipPath
}

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

$zipFile    = Join-Path -Path $Path -ChildPath "vscode.zip"
$dataFolder = Join-Path -Path $Path -ChildPath "data"
$downloadUrl = "https://code.visualstudio.com/sha/download?build=stable&os=win32-x64-archive"

if ($Setup) {
  
  if (!(Test-Path $Path)) {
    New-Item -ItemType Directory -Path $Path 
  }

  # Download the latest VS Code zip file and extract to the specified directory
  Expand-FromZip -ZipPath $zipFile -ExtractPath $Path

  # Create data directory for persistent VS code data
  New-Item -ItemType Directory -Path $dataFolder -Force 
}

if ($Upgrade) {
  $versionFile      = Join-Path -Path $Path -ChildPath "resources\app\package.json"
  $tempExtractPath  = "$Path-upgrade-temp"
  $tempData         = "$Path-data-temp"

  if (!(Test-Path $versionFile)) {
    Write-Error "Version file not found. Please check VSCode installation."
    exit
  }

  # Check if on latest version already
  $currentVer = (Get-Content $versionFile | ConvertFrom-Json).version

  # true HEAD request
  $request   = [System.Net.Http.HttpRequestMessage]::new('HEAD', $downloadUrl)
  $response  = ([System.Net.Http.HttpClient]::new()).SendAsync($request).Result
  $latestVer = (($response.Content.Headers.ContentDisposition.FileName).Split('"'[-1]).Replace("VSCode-win32-x64-", "").Replace(".zip", ""))

  Write-Output "Installed: $currentVer, Latest: $latestVer"

  # Exit early if up to date
  if ($currentVer -eq $latestVer) {
    Write-Output "VS Code is already up to date."
    exit
  }

  # Continue with download and extraction
  Expand-FromZip -ZipPath $zipFile -ExtractPath $tempExtractPath

  # Check if the extracted package.json file exists to verify successful extraction, otherwise remove temporary files and exit
  if (!(Test-Path "$tempExtractPath\resources\app\package.json")) {
    Remove-Item -Recurse -Force $tempExtractPath
    exit
  }

  # Backup existing data folder before replacing installation
  if (Test-Path $dataFolder) {
    Move-Item -Path $dataFolder -Destination $tempData -Force
  }

  Remove-Item -Recurse -Force $Path
  Move-Item   -Path $tempExtractPath -Destination $Path

  if (Test-Path $tempData) {
    Move-Item -Path $tempData -Destination $dataFolder -Force
  } 
  else {
    New-Item -ItemType Directory -Path $dataFolder -Force
  }
}

# Ensure system PATH is pointed at code.exe
$envPath = [Environment]::GetEnvironmentVariable("Path", [System.EnvironmentVariableTarget]::Machine)
if (!($envPath -like "*$Path*")) {
  [Environment]::SetEnvironmentVariable("Path", "$envPath;$Path", [System.EnvironmentVariableTarget]::Machine)
}
