class CreatePlants < ActiveRecord::Migration
  def change
    create_table :plants do |t|
      t.string :strain_name
      t.string :sex
      t.string :from
      t.integer :crop_id
    end
  end
end
