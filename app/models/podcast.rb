class Podcast < ActiveRecord::Base
  has_many :episodes
  has_and_belongs_to_many :categories
end
