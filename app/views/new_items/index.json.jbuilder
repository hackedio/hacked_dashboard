@new_items.each do |item|
  json.set! item.id do
    json.set! :itemtype, item.itemtype
    json.set! :itemid, item.itemid
  end
end
