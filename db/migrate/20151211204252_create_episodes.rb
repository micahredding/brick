class CreateEpisodes < ActiveRecord::Migration
  def change
    create_table :episodes do |t|
      t.string :number
      t.string :title
      t.text :body
      t.datetime :recorded_at
      t.datetime :published_at
      t.string :image
      t.string :media
      t.integer :media_length
      t.integer :media_size
      t.references :podcast, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
