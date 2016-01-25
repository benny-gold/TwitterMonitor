$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path).Replace(".Tests.", ".")
. "$here\..\$sut"

Describe "Get-TwitterKeyword" {
    It "returns a boolean value" {
       (Get-TwitterKeyword).gettype().Name | Should Be Boolean
    }
}

