get-adgroup -filter { Name -like "*" } | 
foreach {
    write-host $_.name
    get-adgroupmember $_ | 
    foreach {
        write-host " -> "$_.samaccountname
    }
}
