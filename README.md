#README

__Environment variables needed to use this app:__

* TWITTER_CONSUMER_KEY
* TWITTER_CONSUMER_SECRET
* FLICKR_API_KEY
* FLICKR_API_SECRET

__JSON api__

`/tweets.json` => returns all relevent tweet data.
`/flickr_photos.json` => returns all relevent flickr data.

__get tweets__

* Simply type the rake command: `rake get:tweets`
* This will gather any new tweets with the word #hackedio in and add data to the database.


__get flickr photos__

* Simply type the rake command: `rake get:flickr`
* This will find any new flickr photos that have been placed into the specified group and store their URLs in the database.