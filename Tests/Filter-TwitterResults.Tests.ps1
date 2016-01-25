$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path).Replace(".Tests.", ".")
. "$here\..\$sut"

. "$here\..\New-TwitterAuthorisation.ps1"
. "$here\..\Get-TwitterTimeline.ps1"

Describe "Filter-TwitterResults" {
    It "returns a match" {
       Filter-TwitterResults -Tweeter kzdrfa -Hashtag "chif" | Should not be $null
    }
}

