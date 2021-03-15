get-adgroup -Filter { Name -like "*" } | 
foreach {
    write-host $_.name
    get-adgroupmember $_ | 
    foreach {
        Write-Host " -> "$_.samaccountname
    }
}
