class DropGardensUsers < ActiveRecord::Migration
  def change
    drop_table :gardens_users
  end
end
