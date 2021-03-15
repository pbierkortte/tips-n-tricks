# you can run this in powershell ISE, provided you have the ADUC tools installed
# replace the seachbase as needed

get-adgroup -Filter { Name -like "*" } -SearchBase "DC=ad,DC=<myDC>,DC=com" | foreach {
    write-host $_.name
    get-adgroupmember $_ | foreach {
    $myGroup = ($_ | select -expandproperty samaccountname)
    Write-Host " -> "$myGroup
    }
}
