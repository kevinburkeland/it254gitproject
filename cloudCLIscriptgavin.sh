#!/bin/bash

# Variables
RESOURCE_GROUP="storageaccount-RG"
LOCATION="eastus"  # Change to your preferred Azure region
STORAGE_ACCOUNT_NAME="gavinstorageaccount12"  # Ensure globally unique name
CONTAINER_NAMES="clilab1"  # Add container names as needed
COMPRESSFILE="test.tgz"

# Create a resource group
echo "Creating resource group: $RESOURCE_GROUP..."
az group create --name $RESOURCE_GROUP --location $LOCATION

# Create a storage account
echo "Creating storage account: $STORAGE_ACCOUNT_NAME..."
az storage account create \
    --name $STORAGE_ACCOUNT_NAME \
    --resource-group $RESOURCE_GROUP \
    --location $LOCATION \
    --sku Standard_LRS \
    --kind StorageV2

# Retrieve the storage account key
echo "Retrieving storage account key..."
STORAGE_KEY=$(az storage account keys list \
    --resource-group $RESOURCE_GROUP \
    --account-name $STORAGE_ACCOUNT_NAME \
    --query "[0].value" -o tsv)

# should list nothing because no containers exist yet
az storage container list \
    --account-name $STORAGE_ACCOUNT_NAME \
    --account-key $STORAGE_KEY
# Create container
az storage container create --account-name $STORAGE_ACCOUNT_NAME --name clilab1 --account-key $STORAGE_KEY
## for CONTAINER in "${CONTAINER_NAMES[@]}"; do
##    echo "Creating container: $CONTAINER..."
##    az storage container create \
##        --name $CONTAINER \
##        --account-name $STORAGE_ACCOUNT_NAME \
##        --account-key $STORAGE_KEY
## done

az storage container list \
    --account-name $STORAGE_ACCOUNT_NAME \
    --account-key $STORAGE_KEY
echo "Azure Storage Account and containers created successfully!"

# Compress the file and upload it to the storage account
echo "Compressing the file and uploading to Azure Storage..."
tar -czvf $COMPRESSFILE /mnt/c/Users/maver/Desktop/Folders/Development/IT253/test.sh
az storage copy -s /mnt/c/Users/maver/Desktop/Folders/Development/IT253/$COMPRESSFILE --destination-account-name $STORAGE_ACCOUNT_NAME --destination-container $CONTAINER_NAMES