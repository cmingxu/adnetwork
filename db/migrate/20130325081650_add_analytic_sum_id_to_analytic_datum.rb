class AddAnalyticSumIdToAnalyticDatum < ActiveRecord::Migration
  def change
    add_column :analytic_data, :analytic_sum_id, :integer
    add_index  :analytic_data, :analytic_sum_id
  end
end
