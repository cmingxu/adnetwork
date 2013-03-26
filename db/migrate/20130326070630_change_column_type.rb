class ChangeColumnType < ActiveRecord::Migration
  def change
    change_column :analytic_data, :cost, :float
    change_column :analytic_sums, :cost, :float
  end
end
