class AddColumnToPlantsTable < ActiveRecord::Migration
  def change
    add_column :plants, :id_number, :string
  end
end
