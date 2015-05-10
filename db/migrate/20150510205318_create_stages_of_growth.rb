class CreateStagesOfGrowth < ActiveRecord::Migration
  def change
    create_table :stage_of_growths do |t|
      t.string :stage
      t.date :plant_date
      t.string :pot_size
      t.text :grow_medium
    end
  end
end
