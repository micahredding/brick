class AddPublicToPodcasts < ActiveRecord::Migration
  def change
    add_column :podcasts, :public, :boolean, :default => true
  end
end
