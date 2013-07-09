class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :tweetid
      t.string :name
      t.string :screen_name
      t.text :tweet_text
      t.string :media_url
      t.string :profile_image_url
      t.datetime :tweeted_at

      t.timestamps
    end
  end
end
