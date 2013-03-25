class CreateAnalyticSums < ActiveRecord::Migration
  def change
    create_table :analytic_sums do |t|
      t.references :product
      t.references :ad_vender
      t.string :country_code
      t.string :platform
      t.integer :impression
      t.integer :click
      t.integer :install
      t.integer :install
      t.integer :cost
      t.references :artwork
      t.float :cpi
      t.float :cpc
      t.float :ctr
      t.float :cvr

      t.timestamps
    end
    add_index :analytic_sums, :product_id
    add_index :analytic_sums, :ad_vender_id
    add_index :analytic_sums, :artwork_id
  end
end
