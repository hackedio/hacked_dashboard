@new_items.each do |item|
  json.set! item.id do
    json.set! :itemtype, item.itemtype
    json.set! :itemid, item.itemid
  end
end
json.set! :info do
  json.set! :latest_item, @new_items.last.id
  json.set! :first_item, @new_items.first.id
end