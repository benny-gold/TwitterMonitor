function New-TwitterAuthorisation {
    [OutputType([Object])]
    Param
        (
        # Twitter API URIL
        [Parameter(Position=0)]
        [string]$APIURL="https://api.twitter.com/oauth2/token",

        # Twitter Username
        [Parameter(Position=1)]
        [string]$Tweeter,

        # Consumer key
        [Parameter(Position=2)]
        [string]$consumerKey, 

        # Consumer secret
        [Parameter(Position=3)]
        [string]$consumerSecret, 
        
        # Access token
        [Parameter(Position=4)]
        [string]$accessToken, 
        
        # Access token Secret
        [Parameter(Position=5)]
        [string]$accessTokenSecret
        )

    $APICall = $APIURL
    <#    
    https://dev.twitter.com/oauth/application-only
    1. URL encode the consumer key and the consumer secret according to RFC 1738. Note that at the time of writing, this will not actually change the consumer key and secret, but this step should still be performed in case the format of those values changes in the future.
    2.Concatenate the encoded consumer key, a colon character “:”, and the encoded consumer secret into a single string.
    3.Base64 encode the string from the previous step.
    #>

    # 1 & 2
    Add-Type -AssemblyName System.Web
    $AuthString = [System.Web.HttpUtility]::UrlEncode($consumerKey)+":"+[System.Web.HttpUtility]::UrlEncode($consumerSecret)
    # 3
    $encodedAuthString = [System.Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes($AuthString))


    $Headers = @{Authorization="Basic $encodedAuthString"}
    $Body = "grant_type=client_credentials"

    try
        {
        $Response = Invoke-RestMethod -Uri $APICall -Method Post -UserAgent "TwitterMonitor v0.1" -Headers $Headers -body $Body -ErrorAction SilentlyContinue
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