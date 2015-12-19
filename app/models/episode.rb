class Episode < ActiveRecord::Base
  belongs_to :podcast

  def body
    @body || ""
  end

  def summary
    body ? body.truncate(255) : ""
  end

  def url
    "http://localhost:3000/#{podcast.path}/#{number}"
  end
end
