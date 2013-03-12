class AddVersionToArtworkDistribution < ActiveRecord::Migration
  def change
    add_column :artwork_distributions, :version, :string
  end
end
