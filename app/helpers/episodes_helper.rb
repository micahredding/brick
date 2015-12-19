module EpisodesHelper
  def episode_path(episode, options={})
    episode_url(episode, options.merge(:only_path => true))
  end

  def episode_url(episode, options={})
    url_for(options.merge(
      :controller => 'episodes',
      :action => 'show',
      :podcast_path => episode.podcast.path,
      :episode_number => episode.number
    ))
  end

  def markdown
    @markdown ||= Redcarpet::Markdown.new(
      Redcarpet::Render::HTML.new(:link_attributes => Hash["target" => "_blank"]),
      :hard_wrap => true,
      :autolink => true,
      :space_after_headers => true
    )
  end
end
