function Filter-TwitterResults{
        [OutputType([Object])]
        Param
        (
        [Parameter(Mandatory=$True,Position=0)]
        [string]$Tweeter,

        [Parameter(Mandatory=$True,Position=1)]
        [string]$Hashtag
        )
    
    $twitterResults = (Get-TwitterTimeline -Tweeter $Tweeter -tweetCount 100)
    $twitterResults | Where-Object {$_.entities.hashtags.text -contains $hashtag}
    

    
    }

