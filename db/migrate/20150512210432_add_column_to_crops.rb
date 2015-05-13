class AddColumnToCrops < ActiveRecord::Migration
  def change
    add_column :crops, :garden_id, :integer
  end
end
