class CreateAnalyticData < ActiveRecord::Migration
  def change
    create_table :analytic_data do |t|
      t.references :product
      t.references :ad_vender
      t.string :country_code
      t.string :platform
      t.timestamp :report_date
      t.integer :impression
      t.integer :click
      t.integer :install
      t.integer :cost

      t.timestamps
    end
  end
end
