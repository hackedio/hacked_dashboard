require 'csv'
require 'aws-sdk'

namespace :tweets do
  desc "get all tweets in DB, convert them to CSV format, send them to S3 bucket"
  task :csv => :environment do

    obj = bucket.objects['tweets.csv']

    content = CSV.generate do |csv|
      csv << ["tweetid", "name", "screen_name", "tweet_text", "media_url", "profile_image_url", "tweeted_at"]
      Tweet.all.each do |t|
        csv << [t.tweetid,t.name,t.screen_name,t.tweet_text,t.media_url,t.profile_image_url,t.tweeted_at]
      end
    end

    obj.write(content)

  end
end

def s3
  @s3 ||= AWS::S3.new(
    :access_key_id => ENV['AWS_ACCESS_KEY'],
    :secret_access_key => ENV['AWS_SECRET']
  )
end

def bucket
  s3.buckets['hackedio']
end
