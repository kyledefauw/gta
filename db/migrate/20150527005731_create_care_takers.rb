class CreateCareTakers < ActiveRecord::Migration
  def change
    create_table :caretakers do |t|
      t.integer :user_id
      t.integer :garden_id
      t.string :role
      t.timestamps null: false
    end
  end
end
