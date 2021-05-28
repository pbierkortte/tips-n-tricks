$myList = "COMPUTER-1","COMPUTER-2","COMPUTER-3"
$separator = "*" * 80
[Environment]::UserName
Get-Date

foreach ($computername in $myList) {   
    Write-Output $separator
    
    [ADSI]$search  = "WinNT://$computername"
    
    $search.children.where({$_.class -eq 'group' -and $_.Name -eq 'Administrators'}) |
    
    Select `
        @{Name="Computername";Expression={$_.Parent.split("/")[-1] }},
        @{Name="GroupName";Expression={$_.name.value}},
        @{Name="Members";Expression={
            [ADSI]$group = "$($_.Parent)/$($_.Name),group"
            $members = $Group.psbase.Invoke("Members")
                ($members | ForEach-Object {
                $_.GetType().InvokeMember("Name", 'GetProperty', $null, $_, $null)
                }) -join "; "
    }}

}
