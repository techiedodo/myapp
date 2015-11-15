class RemoveEntryFrom < ActiveRecord::Migration
  def change
    remove_column :journals, :entry, :text
  end
end
