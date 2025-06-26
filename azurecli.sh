#assign variables
export MY_RESOURCE_GROUP_NAME="myrg"
export REGION=EastUS
export MY_VM_NAME="myvm"
export MY_USERNAME="azureuser"
export MY_VM_IMAGE="Canonical:0001-com-ubuntu-minimal-jammy:minimal-22_04-lts-gen2:latest"
export MY_SIZE="Standard_B1s"

#create resource group
az group create --name $MY_RESOURCE_GROUP_NAME --location $REGION

#create vm
az vm create \
    --resource-group $MY_RESOURCE_GROUP_NAME \
    --name $MY_VM_NAME \
    --image $MY_VM_IMAGE \
    --admin-username $MY_USERNAME \
    --size $MY_SIZE \
    --assign-identity \
    --generate-ssh-keys \
    --public-ip-sku Standard

#open ports for ssh and http
az vm open-port -g $MY_RESOURCE_GROUP_NAME -n $MY_VM_NAME --port 22,80,443
