json.array!(@categories) do |category|
  json.extract! category, :id, :title, :subtitle
  json.url category_url(category, format: :json)
end
