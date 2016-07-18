$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path).Replace(".Tests.", ".")
Import-Module "$here\..\TwitterMonitor" -Force


Describe "Filter-TwitterResults" {
    It "returns a match" {
       Filter-TwitterResults -Tweeter camelcasehyphen -Hashtag "scrumdaylondon" | Should not be $null
    }
}

