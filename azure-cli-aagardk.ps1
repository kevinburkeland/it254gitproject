# azure-cli-aagardk.ps1
# This script will create an Azure resource group, Azure network security group, set firewall SSH rules, create an Azure virtual machine, allow for SSH testing, and then delete all resources after testing the SSH connection.
# SSH Test must occur in a seperate terminal window.

# Define variables at top of script
$RG = "aagardk-rg"
$NSG = "aagardk-nsg"
$LOC = "westus2"
$VMName = "ubuntu-vm"
$VMImage = "Ubuntu2404"
$VMSize = "Standard_B1s"
$VMAdmin = "aagardk"
$PrivateKeyPath = "$HOME/.ssh/${VMName}_key"
$PublicKeyPath = "$HOME/.ssh/${VMName}_key.pub"

# Prompt login to Azure account
az login

# Create resource group
Write-Host "Creating resource group $RG in $LOC..." -ForegroundColor Cyan
az group create --name $RG --location $LOC | Out-Null

# Create NSG
Write-Host "Creating network security group $NSG..." -ForegroundColor Cyan
az network nsg create `
  --resource-group $RG `
  --name $NSG | Out-Null

# Add SSH rule for Port 22 to newly created security group
Write-Host "Adding SSH Port 22 access rule..." -ForegroundColor Cyan
az network nsg rule create `
  --resource-group $RG `
  --nsg-name $NSG `
  --name "Allow_SSH" `
  --protocol tcp `
  --priority 1010 `
  --destination-port-ranges 22 `
  --access allow | Out-Null
    
# Create B1s VM with Ubuntu 24.04 LTS image
Write-Host "Deploying VM..." -ForegroundColor Cyan
az vm create `
  --resource-group $RG `
  --name $VMName `
  --image $VMImage `
  --size $VMSize `
  --nsg $NSG `
  --admin-username $VMAdmin `
  --ssh-key-values $PublicKeyPath `
  --generate-ssh-keys | Out-Null
  
# Get public IP address of VM for SSH connection
Write-Host "Retrieving public IP address of VM..." -ForegroundColor Cyan
$publicIP = az vm show `
  --resource-group $RG `
  --name $VMName `
  -d `
  --query "publicIps" `
  -o tsv

Write-Host ""
Write-Host "SSH Connect Command: ssh -i $PrivateKeyPath $VMAdmin@$publicIP" -ForegroundColor Yellow

# Allow testing of SSH command to verify creation of VM before deleting
Write-Host ""
Write-Host "VM has been created, you can test SSH connection using the above command in a seperate terminal window." -ForegroundColor Green
Write-Host ""

#Pause script to allow user to test SSH connection before deleting resources
Read-Host "Press [ENTER] to proceed with resource group deletion"

az group delete --name $RG --yes

# Inform user deletion was successful
Write-Host ""
Write-Host "Resource group $RG and all associated resources have been deleted." -ForegroundColor Green