@youtube_videos.each do |v|
  json.set! v.videoid do
    json.set! :authorname, v.authorname
    json.set! :videourl, v.videourl
    json.set! :dateuploaded, v.dateuploaded
  end
end
