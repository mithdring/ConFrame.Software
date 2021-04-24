using module ./Status.psm1
using module ./Software.psm1

function Update-Software {
    [CmdletBinding()]
    [OutputType([Status[]])]
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
            if ((Test-Software -Software $Software -Arguments $Arguments) -eq [Status]::RequiresUpdate) {
                $Software.Update($Arguments)
                Test-Software -Software $Software -Arguments $Arguments
            } else {
                Write-Error -Message "$Software is not installed or is already up-to-date"
            }
        }
    }
    
    end {
    }
}