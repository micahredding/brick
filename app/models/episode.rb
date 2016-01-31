class Episode < ActiveRecord::Base
  belongs_to :podcast
  mount_uploader :image, ImageUploader

  default_scope { order('published_at DESC') }

  def summary
    ApplicationController.helpers.teaser(body)
  end

  def url
    "http://brickcaster.com/#{podcast.path}/#{number}"
  end

  def override_image
    image.present? ? image : podcast.image
  end
end
