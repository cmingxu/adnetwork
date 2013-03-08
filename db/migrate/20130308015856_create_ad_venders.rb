class CreateAdVenders < ActiveRecord::Migration
  def change
    create_table :ad_venders do |t|
      t.string :name

      t.timestamps
    end
  end
end
