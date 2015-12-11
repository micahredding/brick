class CreatePodcasts < ActiveRecord::Migration
  def change
    create_table :podcasts do |t|
      t.string :path
      t.string :title
      t.text :body
      t.string :image
      t.string :author
      t.string :keywords

      t.timestamps null: false
    end
  end
end
