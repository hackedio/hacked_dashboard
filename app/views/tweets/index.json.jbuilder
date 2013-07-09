json.array!(@tweets) do |tweet|
  json.extract! tweet, :tweetid, :name, :screen_name, :tweet_text, :media_url, :profile_image_url, :tweeted_at
  json.url tweet_url(tweet, format: :json)
end
