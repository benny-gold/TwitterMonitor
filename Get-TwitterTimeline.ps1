function Get-TwitterTimeline {
    [OutputType([Object])]
    Param
        (
        # Twitter API URIL
        [Parameter(Position=0)]
        [string]$APIURL="https://api.twitter.com/1.1/statuses/user_timeline.json",

        # Twitter Username
        [Parameter(Mandatory=$True,Position=1)]
        [string]$Tweeter

        #
        )

    $APICall = $APIURL+"?screen_name=$($Tweeter)"

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