json.extract! @podcast, :id, :path, :title, :body, :image, :author, :keywords
json.url podcast_url(@podcast)
json.episodes do
  json.array!(@podcast.episodes) do |episode|
    # id
    json.url episode_url(episode)
    json.guid episode_url(episode)

    # title, summary, content
    json.extract! episode, :number, :title
    json.description episode.override_summary
    json.content markdown(episode.body)
    json.pubDate episode.published_at.to_formatted_s(:rfc822)

    json.itunes do |i|
      i.subtitle  episode.override_summary
      i.summary  "#{episode.override_summary} Read our detailed notes: #{episode_url(episode)}"
      i.duration  episode.duration
      i.author    @podcast.author || 'Micah Redding'
      i.image     episode.override_image
      i.keywords  @podcast.keywords
    end

    # episode media
    json.enclosure url: media_wrapped_url(episode.media), length: episode.media_size, type: 'audio/mpeg'
  end
end