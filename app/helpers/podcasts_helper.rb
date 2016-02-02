module PodcastsHelper
  def podcast_path(podcast, options={})
    url_for(options.merge(:controller => 'podcasts', :action => 'show', :podcast_path => podcast.path, :only_path => true))
  end

  def podcast_url(podcast, options={})
    url_for(options.merge(:controller => 'podcasts', :action => 'show', :podcast_path => podcast.path, :only_path => false))
  end
end
