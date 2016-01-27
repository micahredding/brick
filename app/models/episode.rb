class Episode < ActiveRecord::Base
  belongs_to :podcast

  default_scope { order('published_at DESC') }

  def summary
    ApplicationController.helpers.teaser(body)
  end

  def url
    "http://brickcaster.com/#{podcast.path}/#{number}"
  end
end
