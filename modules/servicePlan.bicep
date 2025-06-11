param namePrefix string
param location string = resourceGroup().location
param skuName string
param capacity int

resource appServicePlan 'Microsoft.Web/serverfarms@2024-11-01' = {
  name: '${namePrefix}-website-plan'
  location: location
  kind: 'ubuntu' // Specify the kind as 'ubuntu' for Linux App Service Plan
  // kind: 'Linux' // Alternatively, you can use 'Linux' if preferred
  tags: {
    'hidden-related:${resourceGroup().id}/providers/Microsoft.Web/sites/${namePrefix}-site': 'Resource'
  } 
  sku: {
    name: skuName
    capacity: capacity
  }
  // properties: {
  //   reserved: true // Indicates that this is a Linux App Service Plan
  //   perSiteScaling: false // Disable per-site scaling
  //   maximumElasticWorkerCount: 1 // Set the maximum number of workers
  // }
}

output appServicePlanId string = appServicePlan.id
output appServicePlanName string = appServicePlan.name
output appServicePlanLocation string = appServicePlan.location 
