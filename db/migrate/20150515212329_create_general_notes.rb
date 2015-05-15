class CreateGeneralNotes < ActiveRecord::Migration
  def change
    create_table :general_notes do |t|
      t.text :notes
      t.integer :plant_id
      t.timestamps null: false
    end
  end
end
