module PodcastsHelper
  def podcast_path(podcast, options={})
    podcast_url(podcast, options.merge(:only_path => true))
  end

  def podcast_url(podcast, options={})
    url_for(options.merge(:controller => 'podcasts', :action => 'show', :podcast_path => podcast.path))
  end
end
