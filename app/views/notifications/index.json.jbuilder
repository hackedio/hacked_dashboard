@notifications.each do |n|
  json.set! n.id do
    json.set! :text, n.text
  end
end
unless @notifications.last.nil?
  json.set! :info do
    json.set! :latest_notification, @notifications.last.id.to_s
  end
end
