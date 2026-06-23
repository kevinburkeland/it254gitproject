# DESCRIPTION: IT253 Azure CLI Deployment
# Author: Jordan Ondap
# Version: 1, 06/23/26

# Define variables for easy configuration
$ResourceGroup = "AzureCLIRG"
$Location = "eastus"
$VmName = "myLinuxVM"
$Image = "Ubuntu2204"
$Size = "Standard_B1s"
$AdminUsername = "404usernotfound"

# Create the Resource Group
Write-Host "Creating resource group: $ResourceGroup in $Location..."
az group create --name $ResourceGroup --location $Location

# Create the Linux Virtual Machine using the generated key
Write-Host "Creating VM: $VmName of size $Size..."
az vm create `
  --resource-group $ResourceGroup `
  --name $VmName `
  --image $Image `
  --size $Size `
  --admin-username $AdminUsername `
  --generate-ssh-keys

Write-Host "Moving the private key to your Downloads folder..."
# This moves the key Azure made, renames it perfectly, and puts it in Downloads
Move-Item -Path "$HOME\.ssh\id_rsa" -Destination "$HOME\Downloads\${VmName}_key.pem" -Force

Write-Host "Done! Your key is in your Downloads folder."