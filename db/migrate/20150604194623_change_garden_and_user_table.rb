class ChangeGardenAndUserTable < ActiveRecord::Migration
  def change
    drop_table :garden_and_users

    create_table :gardens_users, :id => false do |t|
      t.integer :garden_id
      t.integer :user_id
    end
  end
end
