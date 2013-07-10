@flickr_photos.each do |f|
  json.set! f.photoid do
    json.set! :ownername, f.ownername
    json.set! :photo_url, f.photo_url
    json.set! :date_added, f.date_added
  end
end
