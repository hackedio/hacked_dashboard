@tweets.each do |tweet|
  json.set! tweet.tweetid do
    json.set! :name, tweet.name
    json.set! :screen_name, tweet.screen_name
    json.set! :tweet_text, tweet.tweet_text
    json.set! :media_url, tweet.media_url
    json.set! :profile_image_url, tweet.profile_image_url
    json.set! :tweeted_at, tweet.tweeted_at
    json.url tweet_url(tweet, format: :json)
  end
end
