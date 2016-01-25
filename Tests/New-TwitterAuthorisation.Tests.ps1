$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path).Replace(".Tests.", ".")
. "$here\..\$sut"

Describe "New-TwitterAuthorisation" {
    It "Doesn't return an error" {
        (New-TwitterAuthorisation).error | Should Be $null
    }
    It "Shouldn't get a 400 back from the server" {
        (New-TwitterAuthorisation ).status | Should not Be "400"
    }
    It "Returns a successful Message" {
        New-TwitterAuthorisation | Should Be "Ok"
    }
}
