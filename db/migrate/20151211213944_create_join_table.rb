class CreateJoinTable < ActiveRecord::Migration
  def change
    create_join_table :podcasts, :categories do |t|
      # t.index [:podcast_id, :category_id]
      # t.index [:category_id, :podcast_id]
    end
  end
end
