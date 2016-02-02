class Podcast < ActiveRecord::Base
  has_many :category_podcast_associations
  has_many :categories, through: :category_podcast_associations
  has_many :episodes
  mount_uploader :image, ImageUploader

  def episode(number)
    episodes.published.where(:number => number).first
  end
end
