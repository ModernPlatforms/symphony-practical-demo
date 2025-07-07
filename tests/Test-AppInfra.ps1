BeforeAll {
  Import-Module BenchPress.Azure

  $resourceGroupName = $env:resourceGroupName
  $prefix = "symphonydemo"
}

Describe "Azure Infra Smoke Test" {
  It "Should deploy App Service Plan" {
    $asp = Get-AzBPResource -ResourceType 'Microsoft.Web/serverfarms' -ResourceGroupName $resourceGroupName -ResourceName "-asp"
    $asp | Should -Not -BeNullOrEmpty
  }

  It "Should deploy Web App and be HTTPS only" {
    $web = Get-AzBPResource -ResourceType 'Microsoft.Web/sites' -ResourceGroupName $resourceGroupName -ResourceName "-web"
    $web | Should -Not -BeNullOrEmpty
    $web.properties.httpsOnly | Should -Be $true
  }

  It "Should deploy Key Vault" {
    $kv = Get-AzBPResource -ResourceType 'Microsoft.KeyVault/vaults' -ResourceGroupName $resourceGroupName -ResourceName "-kv"
    $kv | Should -Not -BeNullOrEmpty
    $kv.properties.enableSoftDelete | Should -Be $true
  }

  It "Should deploy App Config" {
    $ac = Get-AzBPResource -ResourceType 'Microsoft.AppConfiguration/configurationStores' -ResourceGroupName $resourceGroupName -ResourceName "-appcfg"
    $ac | Should -Not -BeNullOrEmpty
  }

  It "Should deploy Static Web App" {
    $swa = Get-AzBPResource -ResourceType 'Microsoft.Web/staticSites' -ResourceGroupName $resourceGroupName -ResourceName "-swa"
    $swa | Should -Not -BeNullOrEmpty
  }
}
