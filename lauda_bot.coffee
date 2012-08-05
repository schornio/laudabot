# Lauda Bot v1
# By @thschorn

twitter = require('twit')

twitterInstance = new twitter({
     consumer_key:         '...',
     consumer_secret:      '...',
     access_token:         '...',
     access_token_secret:  '...'
})

iAmNotTheWohlfahrt = (originalTweet) ->
     theMessage = "@" + originalTweet.user.screen_name + " Ich hab doch nichts zu verschenken!"
     twitterInstance.post('statuses/update', { status: theMessage, in_reply_to_status_id: originalTweet.id_str }, (err, reply) ->
          if err
               console.log(err)
     )
     console.log(originalTweet.text)

stream = twitterInstance.stream('statuses/filter', { track: 'Niki Lauda' })

stream.on('tweet', (tweet) ->
     setTimeout(()->
          iAmNotTheWohlfahrt(tweet)
     , 5000)
)