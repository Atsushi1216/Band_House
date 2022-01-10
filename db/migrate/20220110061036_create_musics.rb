class CreateMusics < ActiveRecord::Migration[5.2]
  def change
    create_table :musics do |t|
      t.text :title
      t.text :caption
      t.string :song_image_id
      t.string :song
      t.integer :user_id

      t.timestamps
    end
  end
end
