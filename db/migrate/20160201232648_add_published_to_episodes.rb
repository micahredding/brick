class AddPublishedToEpisodes < ActiveRecord::Migration
  def change
    add_column :episodes, :published, :boolean, :default => true
  end
end
