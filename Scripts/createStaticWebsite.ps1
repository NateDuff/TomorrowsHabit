Param(
    [string]$storageAccountName,
    [string]$storageAccountKey,
    [string]$indexPage = "index.html",
    [string]$errorPage = "404.html"
)

Install-Module "Az.Storage" -Force -AllowClobber
Import-Module "Az.Storage"

$storageParams = @{
    StorageAccountName = $storageAccountName
    StorageAccountKey = $storageAccountKey
}

$staticWebsiteParams = @{
    IndexDocument = $indexPage
    ErrorDocument404Path = $errorPage
    Context = (New-AzStorageContext @storageParams)
}

Enable-AzStorageStaticWebsite @staticWebsiteParams