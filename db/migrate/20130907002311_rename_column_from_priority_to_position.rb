class RenameColumnFromPriorityToPosition < ActiveRecord::Migration
  def change
    rename_column :queued_recipes, :priority, :position
  end
end
