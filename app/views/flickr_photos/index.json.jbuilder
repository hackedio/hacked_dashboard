json.array!(@flickr_photos) do |flickr_photo|
  json.extract! flickr_photo, :ownername, :server, :photoid, :secret
  json.url flickr_photo_url(flickr_photo, format: :json)
end
