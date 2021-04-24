using module ./Software.psm1

function New-Software {
    [CmdletBinding()]
    [OutputType([Software])]
    param (
        # Software's Publisher
        [Parameter(Mandatory)]
        [string]
        $Publisher,

        # Software's Name
        [Parameter(Mandatory)]
        [string]
        $Name,

        # Software's version
        [Parameter(Mandatory)]
        [string]
        $Version,

        # Scriptblock to install software
        [Parameter(Mandatory)]
        [scriptblock]
        $Install,

        # Scriptblock to update software
        [Parameter()]
        [scriptblock]
        $Update = {
            Write-Error -Exception NotImplemented
        },

        # Scriptblock to uninstall software
        [Parameter(Mandatory)]
        [scriptblock]
        $Uninstall,

        # Scriptblock to test if software is configured
        [Parameter(Mandatory)]
        [scriptblock]
        $Test,

        # Additional software properties
        [Parameter()]
        [hashtable]
        $Properties
    )
    
    begin {
    }
    
    process {
        [Software]::new(
            $Publisher,
            $Name,
            $Version,
            $Properties,
            $Install,
            $Update,
            $Uninstall,
            $Test)
    }
    
    end {
    }
}