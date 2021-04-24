using module ./Status.psm1
using module ./Software.psm1

function Test-Software {
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
            $Software.Test($Arguments)
        }
    }
    
    end {
    }
}