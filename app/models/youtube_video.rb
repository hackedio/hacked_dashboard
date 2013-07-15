class YoutubeVideo < ActiveRecord::Base
  after_create :create_new_item

  def create_new_item
    new_item = NewItem.new(itemtype:"youtube",itemid:self.videoid)
    if new_item.save
      puts "NewItem added: youtube video, id: #{new_item.itemid}"
    else
      puts "Something went wrong, no NewItem added for youtube video: #{new_item.itemid}..."
    end
  end
end
