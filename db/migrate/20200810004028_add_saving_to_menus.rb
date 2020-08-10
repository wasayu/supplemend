class AddSavingToMenus < ActiveRecord::Migration[5.2]
  def change
    add_column :menus, :Saving, :boolean, default: false, null: false
    add_column :menus, :menu_name, :string
  end
end
