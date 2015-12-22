class Episode < ActiveRecord::Base
  belongs_to :podcast

  default_scope { order('published_at DESC') }

  def summary
    body ? body.truncate(255) : ""
  end

  def url
    "http://localhost:3000/#{podcast.path}/#{number}"
  end
end
