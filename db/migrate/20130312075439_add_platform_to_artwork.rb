class AddPlatformToArtwork < ActiveRecord::Migration
  def change
    add_column :artworks, :platform, :string
  end
end
