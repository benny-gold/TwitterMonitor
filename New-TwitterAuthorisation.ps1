function New-TwitterAuthorisation {
    [OutputType([Object])]
    Param
        (
        # Twitter API URIL
        [Parameter(Position=0)]
        [string]$APIURL="https://api.twitter.com/1.1/",

        # Twitter Username
        [Parameter(Position=1)]
        [string]$Tweeter

        #
        )

    $APICall = $APIURL+""

    try
        {
        $Response = Invoke-RestMethod -Uri $APICall -ErrorAction SilentlyContinue
        }
    catch [System.Net.WebException] 
        {
        $Response = $_.exception.Response
        }
    catch 
        {
        Write-Error $_.Exception
        return $null
        }
    return $Response
    }


