class RenameGardenAndUser < ActiveRecord::Migration
  def change
    rename_table :garden_and_users, :gardens_users
  end
end
