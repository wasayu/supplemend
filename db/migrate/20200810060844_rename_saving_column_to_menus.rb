class RenameSavingColumnToMenus < ActiveRecord::Migration[5.2]
  def change
    rename_column :menus, :Saving, :saving
  end
end
