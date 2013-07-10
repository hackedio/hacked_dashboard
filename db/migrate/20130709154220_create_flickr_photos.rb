class CreateFlickrPhotos < ActiveRecord::Migration
  def change
    create_table :flickr_photos do |t|
      t.string :ownername
      t.string :photo_url
      t.datetime :date_added

      t.timestamps
    end
  end
end
