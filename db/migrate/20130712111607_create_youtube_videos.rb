class CreateYoutubeVideos < ActiveRecord::Migration
  def change
    create_table :youtube_videos do |t|
      t.string :videoid
      t.string :videourl
      t.string :authorname
      t.datetime :dateuploaded

      t.timestamps
    end
  end
end
