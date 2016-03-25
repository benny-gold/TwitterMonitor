$here = Split-Path -Parent $MyInvocation.MyCommand.Path

Import-Module "$here\..\TwitterMonitor" -Force 

Describe "TwitterMonitor Module" {
    It "Exports Commands" {
        (Get-Command -Module TwitterMonitor).count | Should Be 3
    }
    It "Exports Variables" {
        $consumerSecret | Should Not Be Null
    }


}
