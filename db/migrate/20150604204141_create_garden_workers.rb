class CreateGardenWorkers < ActiveRecord::Migration
  def change
    create_table :garden_workers do |t|
      t.integer :garden_id
      t.integer :caretaker_id
    end
  end
end
