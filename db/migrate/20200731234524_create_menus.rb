class CreateMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :menus do |t|
      t.references :user, foreign_key: true
      t.references :suggestion, foreign_key: true
      t.boolean :saving, default: false, null: false
      t.string :name

      t.timestamps
    end
  end
end
