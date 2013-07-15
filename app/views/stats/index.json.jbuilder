json.array!(@stats) do |stat|
  json.extract! stat, :name, :value, :display
  json.url stat_url(stat, format: :json)
end
