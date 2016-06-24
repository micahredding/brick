xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0", "xmlns:itunes" => "http://www.itunes.com/dtds/podcast-1.0.dtd", "xmlns:atom" => "http://www.w3.org/2005/Atom", "xmlns:content"=>"http://purl.org/rss/1.0/modules/content/" do
  xml.channel do
    xml.atom :link, :href => podcast_url(@podcast, :format => :rss), :rel => "self", :type => "application/rss+xml"

    # id
    xml.link podcast_url(@podcast)
    xml.itunes :'new-feed-url', podcast_url(@podcast, :format => :rss)

    # title, summary, content
    xml.title @podcast.title
    xml.itunes :subtitle, @podcast.body
    xml.itunes :summary, @podcast.body
    xml.description @podcast.body

    # @podcast image
    xml.itunes :image, :href => @podcast.image

    # @podcast meta
    xml.language 'en-us'
    xml.copyright 'copyright 2012-2015 Micah Redding'
    xml.itunes :author, @podcast.author || 'Micah Redding'
    xml.itunes :owner do
      xml.itunes :name, 'Micah Redding'
      xml.itunes :email, 'micahtredding@gmail.com'
    end

    # categories
    xml.itunes :keywords, @podcast.keywords
    @podcast.categories.each do |category|
      if category.subtitle
        xml.itunes :category, :text => category.title do
          xml.itunes :category, :text => category.subtitle
        end
      else
        xml.itunes :category, :text => category.title
      end
    end

    xml.itunes :explicit, "no"

    @episodes.each do |episode|
      xml.item do
        # id
        xml.guid episode_url(episode)
        xml.link episode_url(episode)

        # title, summary, content
        xml.title episode.title
        xml.itunes :subtitle, episode.override_summary
        xml.itunes :summary, "#{episode.override_summary} Read our detailed notes: #{episode_url(episode)}"
        xml.description episode.override_summary
        xml.content :encoded, markdown(episode.body)

        # episode media
        xml.enclosure :url => media_wrapped_url(episode.media), :length => episode.media_size, :type => 'audio/mpeg'

        # episode meta
        xml.pubDate episode.published_at.to_formatted_s(:rfc822)
        xml.itunes :duration, Time.at(episode.media_length).utc.strftime("%H:%M:%S")

        # podcast meta
        xml.itunes :author,  @podcast.author || 'Micah Redding'
        xml.itunes :image, :href => episode.override_image
        xml.itunes :keywords, @podcast.keywords
      end
    end
  end
end
