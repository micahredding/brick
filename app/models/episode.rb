require 'open-uri'
require 'stringio'
require 'net/http'
require 'uri'
require 'mp3info'

class Episode < ActiveRecord::Base
  belongs_to :podcast
  mount_uploader :image, ImageUploader

  default_scope  { order(:published_at => :desc) }

  scope(:published, lambda {
    where(:state => :published)
  })

  def published?
    state == "published"
  end

  def preview?
    state == "preview"
  end

  def unpublished?
    state == "unpublished"
  end

  def override_summary
    return summary if summary.present?
    return ApplicationController.helpers.teaser(body) if body.present?
    nil
  end

  def override_image
    image.present? ? image : podcast.image
  end

  def duration
    Time.at(self.media_length).utc.strftime("%H:%M:%S")
  end

  def mp3_tags
    return @mp3_tags if @mp3_tags.present?
    return {} if media.empty?
    @mp3_tags = {}

    url = URI.parse(media) # turn the string into a URI
    http = Net::HTTP.new(url.host, url.port)
    req = Net::HTTP::Get.new(url.path) # init a request with the url
    # req.range = (0..5096) # limit the load to only 4096 bytes
    res = http.request(req) # load the mp3 file
    mp3_string = StringIO.open(res.body)
    Mp3Info.open(mp3_string) do |mp3|
      @mp3_tags[:title]     = mp3.tag.title
      @mp3_tags[:artist]    = mp3.tag.artist
      @mp3_tags[:album]     = mp3.tag.album
      @mp3_tags[:tracknum]  = mp3.tag.tracknum
      @mp3_tags[:length]    = mp3.length
      @mp3_tags[:bitrate]   = mp3.bitrate
    end
    @mp3_tags[:size]        = mp3_string.size
    @mp3_tags
  end

  def mp3_size
    mp3_tags[:size]
  end

  def mp3_length
    mp3_tags[:length].to_i
  end

  def mp3_title
    mp3_tags[:title]
  end

  def get_media
    return nil unless media
    update_attributes(:media_size   => mp3_size,
                      :media_length => mp3_length,
                      :title        => mp3_title)
  end

end
