module EpisodesHelper
  def media_wrapped_url(media_url)
    "http://dts.podtrac.com/redirect.mp3/#{media_url}"
  end

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

  class BrickRenderer < Redcarpet::Render::HTML
    def add_amazon_affiliate_param(link)
      separator = /\?/.match(link) ? '&' : '?'
      link + separator + 'tag=micahredding-20'
    end

    def is_amazon_link?(link)
      /(http|https):\/\/(.*amazon\..*\/.*|.*amzn\.com\/.*|.*amzn\.to\/.*)/.match(link)
    end

    def link(link, title, content)
      if is_amazon_link?(link)
        link = add_amazon_affiliate_param(link)
      end
      "<a href='#{link}' title='#{title}' target='_blank'>#{content}</a>"
    end
  end

  def markdown_renderer
    @markdown_renderer ||= Redcarpet::Markdown.new(
      BrickRenderer.new(:link_attributes => Hash["target" => "_blank"]),
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
