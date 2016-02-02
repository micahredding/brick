module EpisodesHelper
  def episode_path(episode, options={})
    url_for(options.merge(
      :controller => 'episodes',
      :action => 'show',
      :podcast_path => episode.podcast.path,
      :episode_number => episode.number,
      :only_path => true,
    ))
  end

  def episode_url(episode, options={})
    url_for(options.merge(
      :controller => 'episodes',
      :action => 'show',
      :podcast_path => episode.podcast.path,
      :episode_number => episode.number,
      :only_path => false,
    ))
  end

  def markdown_renderer
    @markdown_renderer ||= Redcarpet::Markdown.new(
      Redcarpet::Render::HTML.new(:link_attributes => Hash["target" => "_blank"]),
      :hard_wrap => true,
      :autolink => true,
      :space_after_headers => true,
      :footnotes => true,
    )
  end

  def markdown(text)
    return "" unless text
    markdown_renderer.render(text).html_safe
  end

  def plain_text(text)
    strip_tags(markdown(text))
  end

  def first_paragraph(text)
    plain_text(text).split("\n")[0]
  end

  def teaser(text)
    first_paragraph(text).truncate(250)
  end
end
