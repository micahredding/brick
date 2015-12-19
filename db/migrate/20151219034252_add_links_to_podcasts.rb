class AddLinksToPodcasts < ActiveRecord::Migration
  def change
    add_column :podcasts, :itunes, :string
    add_column :podcasts, :email, :string
  end
end
