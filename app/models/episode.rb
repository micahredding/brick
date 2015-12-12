class Episode < ActiveRecord::Base
  belongs_to :podcast

  def summary
    body.truncate(255)
  end

  def url
    "http://localhost:3000/#{podcast.path}/#{number}"
  end
end
