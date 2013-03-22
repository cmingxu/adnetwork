class AddIndexToAnalyticData < ActiveRecord::Migration
  def change
    add_index :analytic_data, :product_id
    add_index :analytic_data, :ad_vender_id
    add_index :analytic_data, :country_code
    add_index :analytic_data, :platform
  end
end
