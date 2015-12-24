class AddPositionToCategoriesPodcasts < ActiveRecord::Migration
  def change
    add_column :categories_podcasts, :position, :integer
  end
end
