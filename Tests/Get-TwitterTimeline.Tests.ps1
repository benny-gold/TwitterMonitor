$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path).Replace(".Tests.", ".")
Import-Module "$here\..\TwitterMonitor.psm1"

Describe "Get-TwitterTimeline" {
    It "should send a good request" {
        (Get-TwitterTimeline -Tweeter kzdrfa).statuscode | Should not Be "BadRequest"
    }
    It "should be authenticated" {
        (Get-TwitterTimeline -Tweeter kzdrfa).IsMutuallyAuthenticated | Should not Be $false
    }
    It "should return the correct number of results" {
        (Get-TwitterTimeline -Tweeter kzdrfa -tweetCount 7).count | Should Be 7
    }

}
