param location string = resourceGroup().location
param namePrefix string
param appServicePlanId string
param dockerImage string
param dockerImageTag string

resource webApplication 'Microsoft.Web/sites@2021-01-15' = {
  name: '${namePrefix}-site'
  location: location
  tags: {
    'hidden-related:${resourceGroup().id}/providers/Microsoft.Web/serverfarms/appServicePlan': 'Resource'
  }
  properties: {
    serverFarmId: appServicePlanId
    httpsOnly: true
    siteConfig: {
      appSettings: [
        {
          name: 'DOCKER_REGISTRY_SERVICE_URL'
          value: 'https://index.docker.io'
        }
        {
          name: 'DOCKER_REGISTRY_SERVER_USERNAME'
          value: ''
        }
        {
          name: 'DOCKER_REGISTRY_SERVER_PASSWORD'
          value: ''
        }
        {
          name: 'WEBSITES_ENABLE_APP_SERVICE_STORAGE'
          value: 'false'
        }
      ]
      linuxFxVersion: 'DOCKER|${dockerImage}:${dockerImageTag}'
      //linuxFxVersion: 'DOCKER|yourACRName.azurecr.io/nginx:latest'
      // Additional Web App configurations
    }
  }
}

output webApplicationId string = webApplication.id
output webApplicationName string = webApplication.name
output siteUrl string = webApplication.properties.defaultHostName
