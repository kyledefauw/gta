class CreateJoinedGardenUserTable < ActiveRecord::Migration
  def change
    create_table :garden_and_users do |t|
      t.integer :user_id
      t.integer :garden_id
    end
  end
end
