class CreateFlickrPhotos < ActiveRecord::Migration
  def change
    create_table :flickr_photos do |t|
      t.string :ownername
      t.string :server
      t.string :photoid
      t.string :secret

      t.timestamps
    end
  end
end
