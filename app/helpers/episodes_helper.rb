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
end
