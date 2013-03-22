class AddVenderFeedbackIdToAnalyticData < ActiveRecord::Migration
  def change
    add_column :analytic_data, :vender_feedback_id, :integer
  end
end
