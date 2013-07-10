class FlickrPhoto < ActiveRecord::Base
  after_create :create_new_item

  def create_new_item
    new_item = NewItem.new(itemtype:"flickr",itemid:self.photoid)
    if new_item.save
      puts "NewItem added: flickr photo, id: #{new_item.itemid}"
    else
      puts "Something went wrong, no NewItem added for flickr photo: #{new_item.itemid}..."
    end
  end
end
