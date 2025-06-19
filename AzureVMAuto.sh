# === Configuration === Setting variables to use in the setup process below
RESOURCE_GROUP="CLIscript-rg"
LOCATION="eastus"
VM_NAME="CliScript-vm"
IMAGE="Ubuntu2404"
SIZE="Standard_B1s"
ADMIN_USER="azureuser"
NSG_NAME="${VM_NAME}-nsg"
VNET_NAME="${VM_NAME}-vnet"
SUBNET_NAME="${VM_NAME}-subnet"
IP_NAME="${VM_NAME}-ip"
NIC_NAME="${VM_NAME}-nic"
#STARTUP_SCRIPT="kickstart.sh"
# === Create Resource Group ===
az group create --name $RESOURCE_GROUP --location $LOCATION
# === Create Virtual Network and Subnet ===
az network vnet create --resource-group $RESOURCE_GROUP --name $VNET_NAME \
--subnet-name $SUBNET_NAME
# === Create Network Security Group and Rules ===
az network nsg create --resource-group $RESOURCE_GROUP --name $NSG_NAME
az network nsg rule create --resource-group $RESOURCE_GROUP --nsg-name $NSG_NAME \
--name AllowSSH --protocol Tcp --direction Inbound --priority 1000 \
--source-address-prefixes '*' --source-port-ranges '*' \
--destination-address-prefixes '*' --destination-port-ranges 22 \
--access Allow
az network nsg rule create --resource-group $RESOURCE_GROUP --nsg-name $NSG_NAME \
--name AllowHTTP --protocol Tcp --direction Inbound --priority 1001 \
--source-address-prefixes '*' --source-port-ranges '*' \
--destination-address-prefixes '*' --destination-port-ranges 80 \
--access Allow
# === Create Public IP ===
az network public-ip create --resource-group $RESOURCE_GROUP --name $IP_NAME
# === Create NIC ===
az network nic create --resource-group $RESOURCE_GROUP --name $NIC_NAME \
--vnet-name $VNET_NAME --subnet $SUBNET_NAME --network-security-group $NSG_NAME
\
--public-ip-address $IP_NAME
# === Create VM and run the kickstart/custom-data script ===
az vm create \
--resource-group $RESOURCE_GROUP \
--name $VM_NAME \
--image $IMAGE \
--size $SIZE \
--admin-username $ADMIN_USER \
--generate-ssh-keys \
--nics $NIC_NAME \
#--custom-data $STARTUP_SCRIPT
# === Output IP Address to set variable so that i can print the ip address to
#connect to the wordpress ===
#IP_ADDRESS=$(az vm list-ip-addresses --resource-group $RESOURCE_GROUP --name
#$VM_NAME \
#--query "[].virtualMachine.network.publicIpAddresses[].ipAddress" -o tsv)
#echo "Deployment complete. Access WordPress at: http://$IP_ADDRESS"