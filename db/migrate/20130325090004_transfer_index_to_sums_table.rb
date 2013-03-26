class TransferIndexToSumsTable < ActiveRecord::Migration
  def change
    remove_index :analytic_data, :click
    remove_index :analytic_data, :cost
    remove_index :analytic_data, :country_code
    remove_index :analytic_data, :install
    remove_index :analytic_data, :platform

    add_index :analytic_sums, :platform
    add_index :analytic_sums, :impression
    add_index :analytic_sums, :click
    add_index :analytic_sums, :install
    add_index :analytic_sums, :cost
    add_index :analytic_sums, :cpi
    add_index :analytic_sums, :cpc
    add_index :analytic_sums, :ctr
    add_index :analytic_sums, :cvr
  end
end
