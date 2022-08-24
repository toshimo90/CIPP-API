param($name)
Set-Location $ENV:CippRoot
#$Skiplist = (Get-Content ExcludedTenants -ErrorAction SilentlyContinue | ConvertFrom-Csv -Delimiter "|" -Header "name", "date", "user").name
$Tenants = Get-Tenants #Get-Content ".\tenants.cache.json" | ConvertFrom-Json | Where-Object {$Skiplist -notcontains $_.defaultDomainName}

$object = foreach ($Tenant in $Tenants) {
    $Tenant.defaultDomainName
}

$object