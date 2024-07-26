# Input bindings are passed in via param block.
param($Timer)

# Get the current universal time in the default string format
$currentUTCtime = (Get-Date).ToUniversalTime()

# The 'IsPastDue' porperty is 'true' when the current function invocation is later than scheduled.
if ($Timer.IsPastDue) {
    Write-Host "PowerShell timer is running late!"
}

# Define an array of strings for the "lst" parameter
$lstArray = @()

$response = Invoke-WebRequest -Uri "https://raw.githubusercontent.com/igneous-labs/sanctum-lst-list/master/sanctum-lst-list.toml"
$lst_list = $response.Content | ConvertFrom-Toml

$lst_list.sanctum_lst_list | ForEach-Object { $lstArray += $_.mint }

# Construct the URL with the "lst" parameters
$url = "https://sanctum-extra-api.ngrok.dev/v1/apy/latest?" + ($lstArray -join "&lst=")
# Make the request
$response = Invoke-RestMethod -Uri $url

# Write data to Azure Storage Table
$storageAccountName = "ggsanctumapychecker"
$storageAccountKey = $env:TABLE_STORAGE_KEY
$tableName = "sanctumApys"

# Create a storage context
$context = New-AzStorageContext -StorageAccountName $storageAccountName -StorageAccountKey $storageAccountKey

$storageTable = Get-AzStorageTable -Name $tableName -Context $context

$date = Get-Date -Format "yyyy-MM-dd HH:00:00"
# Iterate over the "apys" and "errs" properties
foreach ($lst in $response.apys.PSObject.Properties) {
    Add-AzTableRow `
        -table $storageTable.CloudTable `
        -partitionKey $lst.Name `
        -rowKey $date `
        -property @{"APY" = $lst.Value }
}

foreach ($lst in $response.errs.PSObject.Properties) {
    Add-AzTableRow `
        -table $storageTable.CloudTable `
        -partitionKey $lst.Name `
        -rowKey $date `
        -property @{ "APY" = "-1"; "error_message" = "$($lst.Value.message)"; "error_code" = $lst.Value.code }
}

# Write an information log with the current time.
Write-Host "PowerShell timer trigger function ran! TIME: $currentUTCtime"
