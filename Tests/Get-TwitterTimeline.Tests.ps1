$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path).Replace(".Tests.", ".")
Import-Module "$here\..\TwitterMonitor" -Force

Describe "Get-TwitterTimeline" {
    It "should send a good request" {
        (Get-TwitterTimeline -Tweeter camelcasehyphen).statuscode | Should not Be "BadRequest"
    }
    It "should be authenticated" {
        (Get-TwitterTimeline -Tweeter camelcasehyphen).IsMutuallyAuthenticated | Should not Be $false
    }
    It "should return the correct number of results" {
        (Get-TwitterTimeline -Tweeter camelcasehyphen -tweetCount 4).count | Should Be 4
    }

}
