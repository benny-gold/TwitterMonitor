$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path).Replace(".Tests.", ".")
Import-Module "$here\..\TwitterMonitor"


Describe "Filter-TwitterResults" {
    It "returns a match" {
       Filter-TwitterResults -Tweeter kzdrfa -Hashtag "chif" | Should not be $null
    }
}

