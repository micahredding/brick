class CategoryPodcastAssociation < ActiveRecord::Base
  self.table_name = "categories_podcasts"
  belongs_to :podcast
  belongs_to :category
  before_create :add_position

  default_scope { order("position ASC") }

  def add_position
    p = CategoryPodcastAssociation.maximum(:position)
    self.position = p.to_i + 1
  end
end