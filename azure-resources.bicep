@description('Location should be in australiasoutheast')
param location string = resourceGroup().location
param skuName string = 'Premium_LRS'

@description('Storage account name must be globally unique and can only contain lowercase letters and numbers.')
param storageName string = 'udemyrkstorage'
param namePrefix string = 'udemyrk'

param dockerImage string = 'mcr.microsoft.com/azuredocs/aci-helloworld'
param dockerImageTag string = 'latest'

targetScope = 'resourceGroup'

module storage 'modules/storage.bicep' = {
  name: 'storageModule'
  params: {
    storageName: storageName
    location: location
    skuName: skuName
  }
}

module appServicePlan 'modules/servicePlan.bicep' = {
  name: 'appServicePlanModule'
  params: {
    namePrefix: namePrefix
    location: location
    skuName: 'B1'
    capacity: 1
  }
}

module webApp 'modules/webApp.bicep' = {
  name: 'webAppModule'
  params: {
    location: location
    namePrefix: namePrefix
    appServicePlanId: appServicePlan.outputs.appServicePlanId
    dockerImage: dockerImage
    dockerImageTag: dockerImageTag
  }
}

output siteUrl string = webApp.outputs.siteUrl
output webApplicationId string = webApp.outputs.webApplicationId
output webApplicationName string = webApp.outputs.webApplicationName
