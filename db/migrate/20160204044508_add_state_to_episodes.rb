class AddStateToEpisodes < ActiveRecord::Migration
  def change
    add_column :episodes, :state, :string, :default => :published
  end
end
