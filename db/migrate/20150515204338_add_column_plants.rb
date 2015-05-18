class AddColumnPlants < ActiveRecord::Migration
  def change
    add_column :plants, :id_number, :string
    add_column :plants, :created_at, :datetime, null: false
    add_column :plants, :updated_at, :datetime, null: false
  end
end
