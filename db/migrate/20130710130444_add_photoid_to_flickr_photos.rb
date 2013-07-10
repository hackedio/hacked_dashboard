class AddPhotoidToFlickrPhotos < ActiveRecord::Migration
  def change
    add_column :flickr_photos, :photoid, :string
  end
end
