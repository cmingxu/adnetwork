class AddArtworkToAnalyticDatum < ActiveRecord::Migration
  def change
    add_column :analytic_data, :artwork_id, :integer
    add_index :analytic_data, :artwork_id

    add_index :analytic_data, :click
    add_index :analytic_data, :install
    add_index :analytic_data, :cost
  end
end
