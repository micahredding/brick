json.extract! @podcast, :id, :path, :title, :body, :image, :author, :keywords
json.url podcast_url(@podcast)
json.episodes do
  json.array!(@podcast.episodes) do |episode|
    json.extract! episode, :number, :title
    json.url episode_url(episode)
  end
end