json.array!(@flickr_photos) do |flickr_photo|
  json.extract! flickr_photo, :ownername, :photo_url, :date_added
  json.url flickr_photo_url(flickr_photo, format: :json)
end
