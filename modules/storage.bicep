param storageName string
param location string = resourceGroup().location 
param skuName string

resource storageaccount 'Microsoft.Storage/storageAccounts@2024-01-01' = {
  name: storageName
  location: location
  kind: 'StorageV2'
  sku: {
    name: skuName
  }

  properties: { accessTier: 'Hot' }

}

