class AddGuestToEpisodes < ActiveRecord::Migration
  def change
    add_column :episodes, :guest_name, :string
    add_column :episodes, :guest_twitter, :string
  end
end
