class CreateAlbums < ActiveRecord::Migration[7.0]
  def change
    create_table :albums do |t|
      t.text :thumbnail
      t.text :title
      t.text :subtitle
      t.text :external_id
      t.text :likes_count, default: 0
      t.timestamps
    end
  end
end
