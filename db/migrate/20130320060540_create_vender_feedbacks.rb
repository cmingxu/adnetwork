class CreateVenderFeedbacks < ActiveRecord::Migration
  def change
    create_table :vender_feedbacks do |t|
      t.references :product
      t.references :ad_vender
      t.string :platform
      t.string :chart

      t.timestamps
    end
    add_index :vender_feedbacks, :product_id
    add_index :vender_feedbacks, :ad_vender_id
  end
end
