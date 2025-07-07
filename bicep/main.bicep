@description('Name prefix for all resources')
param namePrefix string = 'demo'

@description('Location for all resources')
param location string = resourceGroup().location

resource asp 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: '${namePrefix}-asp'
  location: location
  sku: {
    name: 'P1v2'
    tier: 'PremiumV2'
  }
}

resource web 'Microsoft.Web/sites@2022-03-01' = {
  name: '${namePrefix}-web'
  location: location
  serverFarmId: asp.id
  httpsOnly: true
}

resource kv 'Microsoft.KeyVault/vaults@2023-02-01' = {
  name: '${namePrefix}-kv'
  location: location
  properties: {
    sku: {
      name: 'standard'
      family: 'A'
    }
    tenantId: subscription().tenantId
    accessPolicies: []
    enabledForDeployment: true
    enableSoftDelete: true
  }
}

resource ac 'Microsoft.AppConfiguration/configurationStores@2023-03-01-preview' = {
  name: '${namePrefix}-appcfg'
  location: location
  sku: { name: 'standard' }
}

resource swa 'Microsoft.Web/staticSites@2022-03-01' = {
  name: '${namePrefix}-swa'
  location: location
  sku: { name: 'Standard' }
}

output webAppUrl string = web.properties.defaultHostName
output staticWebUrl string = swa.properties.defaultHostname
