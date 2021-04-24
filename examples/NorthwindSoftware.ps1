#Requires -Module ConFrame.Software

$Software = @{
    Publisher = "Northwind"
    Name = "Software"
    Version = "2.0.0"
    Install = {
        param ([Software] $Self, [hashtable] $Arguments)
            Write-Debug "Install $Self with $($Arguments | Out-String)"
    }
    Uninstall = {
        param ([Software] $Self, [hashtable] $Arguments)
            Write-Debug "Uninstall $Self with $($Arguments | Out-String)"
    }
    Test = {
        param ([Software] $Self, [hashtable] $Arguments)
            Write-Debug "Test $Self with $($Arguments | Out-String)"
    }
    Properties = @{
        PublisherName = "Northwind LLC"
    }
}
New-Software @Software