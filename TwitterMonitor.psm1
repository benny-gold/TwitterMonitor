Gci "$PSScriptRoot\*.ps1" | ForEach-Object {. $_.FullName}
. "$PSScriptRoot\Tests\Keys.ps1"

Export-ModuleMember -Function Filter-TwitterResults,Get-TwitterTimeline,New-TwitterAuthorisation
Export-ModuleMember -Variable consumerKey,consumerSecret,accessToken,accessTokenSecret
