$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path).Replace(".Tests.", ".")
Import-Module "$here\..\TwitterMonitor" -Force


Describe "New-TwitterAuthorisation" {
    It "Doesn't return an error" {
        (New-TwitterAuthorisation -consumerKey $consumerKey -consumerSecret $consumerSecret -accessToken $accessToken -accessTokenSecret $accessTokenSecret).exception | Should Be $null
    }
    It "Should send a good request" {
        (New-TwitterAuthorisation -consumerKey $consumerKey -consumerSecret $consumerSecret -accessToken $accessToken -accessTokenSecret $accessTokenSecret).statusCode | Should not Be BadRequest
    }
    It "Returns an access token" {
        (New-TwitterAuthorisation -consumerKey $consumerKey -consumerSecret $consumerSecret -accessToken $accessToken -accessTokenSecret $accessTokenSecret).token_type | Should Be Bearer
    }
    It "access token is not blank" {
        (New-TwitterAuthorisation -consumerKey $consumerKey -consumerSecret $consumerSecret -accessToken $accessToken -accessTokenSecret $accessTokenSecret).access_token | Should not Be $null
    }
}
