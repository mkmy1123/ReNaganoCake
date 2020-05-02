class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :genre_id
      t.string :name
      t.text :description
      t.integer :price
      t.string :item_image_id
      t.boolean :is_selling, :boolean, null: false, default: true


      t.timestamps
    end
  end
end
