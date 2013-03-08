class AddArtworkToArtwork < ActiveRecord::Migration
  def change
    add_column :artworks, :artwork, :string
  end
end
