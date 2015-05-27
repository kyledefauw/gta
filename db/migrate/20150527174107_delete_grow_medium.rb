class DeleteGrowMedium < ActiveRecord::Migration
  def change
    drop_table :grow_medium
    add_column :stage_of_growths, :nutrients_added, :string
  end
end
