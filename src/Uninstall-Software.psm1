using module ./Status.psm1
using module ./Software.psm1

function Uninstall-Software {
    [CmdletBinding()]
    [OutputType([Software[]])]
    param (
        # Software to test
        [Parameter(Mandatory, ValueFromPipeline)]
        [Software[]]
        $Software,

        # Optional arguments
        [Parameter()]
        [hashtable]
        $Arguments
    )
    
    begin {
    }
    
    process {
        $Software | ForEach-Object -Process {
            if ((Test-Software -Software $Software -Arguments $Arguments) -ne [Status]::NotInstalled) {
                $Software.Uninstall($Arguments)
                Test-Software -Software $Software -Arguments $Arguments
            } else {
                Write-Error -Message "$Software is not installed"
            }
        }
    }
    
    end {
    }
}