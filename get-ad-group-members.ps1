get-adgroup -filter { Name -like "*IT*" } | 
foreach {
    write-host $_.name
    get-adgroupmember $_ | 
    foreach {
        write-host " -> "$_.samaccountname
    }
}
