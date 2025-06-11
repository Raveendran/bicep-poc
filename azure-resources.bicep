param location string = 'australiaeast' //resourceGroup().location
param storageName string = 'udemyrkstorage' //name${uniqueString(resourceGroup().id)}

// param namePrefix string = 'udemyrk'

// param dockerImage string = 'ubuntu/nginx' //'nginxdemos/hello'
// param dockerImageTag string = 'latest'

// targetScope = 'resourceGroup'

// //how do consume modules
// module storage 'modules/storage.bicep' = {
//   name: storageName
//   params: {
//     storageName: storageName
//     location: location
//   }
// }

// module appPlanDeploy 'modules/servicePlan.bicep' = {
//   name: '${namePrefix}-appPlanDeploy'
//   params: {
//     namePrefix: namePrefix
//     location: location

//   }
// }

// module deployWebsite 'modules/webApp.bicep' = {
//   name: '${namePrefix}-deploy-website'
//   params: {
//     location: location
//     appPlanId: appPlanDeploy.outputs.planId
//     dockerImage: dockerImage
//     dockerImageTag: dockerImageTag
//   }

// }
// output siteUrl string = deployWebsite.outputs.siteUrl

// param location string = 'westus3'
// param storageName string = 'xyzwgastorage'

resource storageaccount 'Microsoft.Storage/storageAccounts@2024-01-01' = {
  name: storageName
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Premium_LRS'
  }
}
