class CreateArtworks < ActiveRecord::Migration
  def change
    create_table :artworks do |t|
      t.string :size
      t.references :product

      t.timestamps
    end
    add_index :artworks, :product_id
  end
end
