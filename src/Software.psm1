using module ./Status.psm1

class Software {
    [string] $Publisher
    [string] $Name
    [string] $Version
    [hashtable] $Properties
    hidden [scriptblock] $InstallScript
    hidden [scriptblock] $UpdateScript
    hidden [scriptblock] $UninstallScript
    hidden [scriptblock] $TestScript

    Software(
        [string] $Publisher,
        [string] $Name,
        [string] $Version,
        [hashtable] $Properties,
        [scriptblock] $InstallScript,
        [scriptblock] $UpdateScript,
        [scriptblock] $UninstallScript,
        [scriptblock] $TestScript) {
        $this.Publisher = $Publisher
        $this.Name = $Name
        $this.Version = $Version
        $this.Properties = $Properties
        $this.InstallScript = $InstallScript
        $this.UpdateScript = $UpdateScript
        $this.UninstallScript = $UninstallScript
        $this.TestScript = $TestScript
    }

    [void] Install([hashtable] $Arguments) {
        Invoke-Command -ScriptBlock $this.InstallScript -ArgumentList @( $this, $Arguments )
    }

    [void] Update([hashtable] $Arguments) {
        Invoke-Command -ScriptBlock $this.UpdateScript -ArgumentList @( $this, $Arguments )
    }

    [void] Uninstall([hashtable] $Arguments) {
        Invoke-Command -ScriptBlock $this.UninstallScript -ArgumentList @( $this, $Arguments )
    }

    [Status] Test([hashtable] $Arguments) {
        return Invoke-Command -ScriptBlock $this.TestScript -ArgumentList @( $this, $Arguments )
    }

    [string] ToString() {
        return "$($this.Publisher) $($this.Name) $($this.Version)"
    }
}