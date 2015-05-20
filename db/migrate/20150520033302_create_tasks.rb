class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.boolean :topped
      t.boolean :trimmed
      t.boolean :staked
      t.boolean :clipped
      t.timestamps null: false
    end
  end
end
