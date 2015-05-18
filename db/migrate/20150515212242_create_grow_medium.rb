class CreateGrowMedium < ActiveRecord::Migration
  def change
    create_table :grow_medium do |t|
      t.string :brand
      t.string :nutrients_added
      t.integer :stage_of_growth_id
      t.timestamps null: false
    end
  end
end
