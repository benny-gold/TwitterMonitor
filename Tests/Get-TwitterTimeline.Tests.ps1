$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path).Replace(".Tests.", ".")
. "$here\..\$sut"

Describe "Get-TwitterTimeline" {
    It "should send a good request" {
        (Get-TwitterTimeline -Tweeter kzdrfa).statuscode | Should not Be "BadRequest"
    }
    It "should be authenticated" {
        (Get-TwitterTimeline -Tweeter kzdrfa).IsMutuallyAuthenticated | Should Be $true
    }
}
