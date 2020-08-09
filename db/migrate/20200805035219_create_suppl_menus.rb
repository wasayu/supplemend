class CreateSupplMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :suppl_menus do |t|
      t.references :menu, foreign_key: true
      t.references :supplement, foreign_key: true

      t.timestamps
    end
  end
end
