class Category < ActiveRecord::Base
  has_many :category_podcast_associations
  has_many :podcasts, through: :category_podcast_associations

  def nice_name
    subtitle.present? ? "#{title} > #{subtitle}" : "#{title}"
  end
end
