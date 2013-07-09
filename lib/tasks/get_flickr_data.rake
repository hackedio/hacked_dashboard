namespace :get do
  desc "Use twitter API to grab relevent tweets and add them to database"
  task :flickr => :environment do

    begin
      loop do
        puts "#{Time.now} : finding flickr photos in env: #{Rails.env}"
        find_new_photos_and_add_them_to_db
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

def add_new_photo(group)
  FlickrPhoto.new do |f|
    f.ownername = group.ownername
    f.photo_url = group.url_z
    f.date_added = Time.at(group.dateadded.to_i)
  end
end

def find_new_photos_and_add_them_to_db
  groups = flickr.groups.pools.getPhotos(:group_id => '48889102397@N01', :extras => 'url_z', :per_page => 50 )

  groups.each do |group|
    unless FlickrPhoto.find_by(photo_url: group.url_z)
      flickr_photo = add_new_photo(group)
      if flickr_photo.save
        puts "Photo from owner: #{group.ownername} data saved"
      else
        puts "Something wrong. Photo from owner: #{group.ownername} not saved."
      end
    end
  end
end
