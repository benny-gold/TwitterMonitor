Gci "$PSScriptRoot\TwitterMonitor\*.ps1" | ForEach-Object {. $_.FullName}
. "$PSScriptRoot\Tests\Keys.ps1"

Export-ModuleMember -Function * 
Export-ModuleMember -Variable consumerKey,consumerSecret,accessToken,accessTokenSecret
