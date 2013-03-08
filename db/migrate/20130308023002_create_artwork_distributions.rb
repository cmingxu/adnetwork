class CreateArtworkDistributions < ActiveRecord::Migration
  def change
    create_table :artwork_distributions do |t|
      t.references :artwork
      t.references :ad_vender

      t.timestamps
    end
    add_index :artwork_distributions, :artwork_id
    add_index :artwork_distributions, :ad_vender_id
  end
end
