json.array!(@podcasts) do |podcast|
  json.extract! podcast, :id, :path, :title, :body, :image, :author, :keywords
  json.url podcast_url(podcast, format: :json)
end
