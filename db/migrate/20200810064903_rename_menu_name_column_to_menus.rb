class RenameMenuNameColumnToMenus < ActiveRecord::Migration[5.2]
  def change
    rename_column :menus, :menu_name, :name
  end
end
