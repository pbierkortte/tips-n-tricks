get-adgroup -Filter { Name -like "*" } | foreach {
    write-host $_.name
    get-adgroupmember $_ | foreach {
    $myGroup = ($_ | select -expandproperty samaccountname)
    Write-Host " -> "$myGroup
    }
}
