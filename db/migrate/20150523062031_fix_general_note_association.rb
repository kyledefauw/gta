class FixGeneralNoteAssociation < ActiveRecord::Migration
  def change
    rename_column :general_notes, :plant_task_id, :plant_id
  end
end
