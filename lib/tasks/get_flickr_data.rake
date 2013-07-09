namespace :get do
  desc "Use twitter API to grab relevent tweets and add them to database"
  task :flickr => :environment do
    groups = flickr.groups.pools.getPhotos(:group_id => '48889102397@N01', :extras => 'url_z', :per_page => 50 )

    groups.each do |group|
      unless FlickrPhoto.find_by(photo_url: group.url_z)
        flickr_photo = add_new_photo(group)
        if flickr_photo.save
          puts "Photo from owner: #{group.ownername} data saved"
        else
          puts "Something wrong. Photo data not saved."
        end
      end
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