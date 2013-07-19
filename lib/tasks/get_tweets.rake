namespace :get do
  desc "Use twitter API to grab relevent tweets and add them to database"
  task :tweets => :environment do

    begin
      loop do
        puts "#{Time.now} : finding tweets in env: #{Rails.env}"
        find_new_tweets_and_add_them_to_db
        puts "Process complete. Sleeping for 60 seconds."
        sleep 60
      end
    rescue => e
      puts "#{Time.now} : something went bad, infact this did: #{e}"
      puts "#{Time.now} : Now going to retry in 60 seconds"
      sleep 60
      retry
    end

  end
end

def find_new_tweets_and_add_them_to_db
  # get tweet id of the latest tweet we've got and use it in search param
  # to make sure we are only searching for newer tweets than ones we've got
  latest_tweet = Tweet.pluck(:tweetid).map { |id| id.to_i }.max

  if latest_tweet.nil?
    tweets = Twitter.search("#hackedio OR #hackedfacts", :include_entities => true)
  else
    tweets = Twitter.search("#hackedio OR #hackedfacts", :include_entities => true, :since_id => latest_tweet)
  end

  tweets.statuses.each do |t|
    unless Tweet.find_by(tweetid: t.id.to_s)
      tweet = create_new_tweet(t)
      if tweet.save
        puts "tweet #{t.id.to_s} saved"
      else
        puts "something wrong. Tweet #{t.id.to_s} not saved."
      end
    end
  end
end

def get_media_url(tweet)
  unless tweet.media.empty?
    return tweet.media[0].media_url
  else
    return nil
  end
end

def create_new_tweet(tweet)
  Tweet.new do |t|
    t.tweetid = tweet.id.to_s
    t.name = tweet.user.name
    t.screen_name = tweet.user.screen_name
    t.tweet_text = tweet.text
    t.media_url = get_media_url(tweet)
    t.profile_image_url = tweet.user.profile_image_url.sub('_normal','_bigger')
    t.tweeted_at = tweet.created_at
  end
end
