using module ./Status.psm1

function ConvertTo-Status {
    [CmdletBinding()]
    [OutputType([Status])]
    param (
        [Parameter(Mandatory, ValueFromPipeline)]
        [bool]
        $Value,

        [Parameter]
        [Status]
        $TrueValue = [Status]::Installed,

        [Parameter]
        [SoftwareStatus]
        $FalseValue = [Status]::NotInstalled
    )
    
    begin {
    }
    
    process {
        if ($Value) {
            $TrueValue
        } else {
            $FalseValue
        }
    }
    
    end {
    }
}