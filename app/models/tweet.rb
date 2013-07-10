class Tweet < ActiveRecord::Base
  after_create :create_new_item

  def create_new_item
    new_item = NewItem.new(itemtype:"tweet",itemid:self.tweetid)
    if new_item.save
      puts "NewItem added: tweet, id: #{new_item.itemid}"
    else
      puts "Something went wrong, no NewItem added for tweet: #{new_item.itemid}..."
    end
  end
end
