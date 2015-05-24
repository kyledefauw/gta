class AddUserIdColumntoGardens < ActiveRecord::Migration
  def change
    add_column :gardens, :user_id, :integer
  end
end
