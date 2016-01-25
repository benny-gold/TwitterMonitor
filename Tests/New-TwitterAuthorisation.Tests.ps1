$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path).Replace(".Tests.", ".")
. "$here\..\$sut"

Describe "New-TwitterAuthorisation" {
    It "Doesn't return an error" {
        (New-TwitterAuthorisation).exception | Should Be $null
    }
    It "Should send a good request" {
        (New-TwitterAuthorisation).statusCode | Should not Be BadRequest
    }
    It "Returns an access token" {
        (New-TwitterAuthorisation).token_type | Should Be Bearer
    }
    It "access token is not blank" {
        (New-TwitterAuthorisation).access_token | Should not Be $null
    }
}
