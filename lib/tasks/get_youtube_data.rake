namespace :get do
  desc "Use youtube API to grab videos with a specific tag and add them to database"
  task :youtube => :environment do

    begin
      loop do
        puts "#{Time.now} : finding youtube videos in env: #{Rails.env}"
        find_new_videos_and_add_them_to_db
        puts "Process complete. Sleeping for 30 seconds."
        sleep 30
      end
    rescue => e
      puts "#{Time.now} : something went bad, infact this did: #{e}"
      puts "#{Time.now} : Now going to retry in 30 seconds"
      sleep 30
      retry
    end

  end
end

def add_new_video(video)
  YoutubeVideo.new do |v|
    v.videoid = video.unique_id
    v.videourl = "http://www.youtube.com/embed/#{video.unique_id}?autoplay=1&loop=1&playlist=#{video.unique_id}"
    v.authorname = video.author.name
    v.dateuploaded = video.uploaded_at
  end
end

def find_new_videos_and_add_them_to_db
  videos = YOUTUBE.videos_by(:tags => [:hackedio]).videos

  videos.each do |video|
    unless YoutubeVideo.find_by(video_id: video.unique_id)
      new_video = add_new_video(video)
      if new_video.save
        puts "Video from user: #{video.author.name} saved"
      else
        puts "Something wrong. Photo from user: #{video.author.name} not saved."
      end
    end
  end
end
