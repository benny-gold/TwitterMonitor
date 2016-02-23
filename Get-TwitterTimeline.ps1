function Get-TwitterTimeline {
    [OutputType([Object])]
    Param
        (
        # Twitter API URIL
        [Parameter(Position=0)]
        [string]$APIURL="https://api.twitter.com/1.1/statuses/user_timeline.json",

        # Twitter Username
        [Parameter(Mandatory=$True,Position=1)]
        [string]$Tweeter,

        # Number of tweets to grab
        [Parameter(Position=2)]
        [int]$tweetCount=50
        )

    $token = New-TwitterAuthorisation -consumerKey $consumerKey -consumerSecret $consumerSecret -accessToken $accessToken -accessTokenSecret $accessTokenSecret
    $APICall = $APIURL+"?screen_name=$($Tweeter)&count=$($tweetCount)"
    $Headers = @{Authorization="Bearer $($token.access_token)"}

    try
        {
        $Response = Invoke-RestMethod -Method Get -UserAgent "TwitterMonitor v0.1" -Headers $Headers -Uri $APICall -ErrorAction SilentlyContinue
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


