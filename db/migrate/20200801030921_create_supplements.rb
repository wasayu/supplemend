class CreateSupplements < ActiveRecord::Migration[5.2]
  def change
    create_table :supplements do |t|
      t.string :item_name
      t.string :brand
      t.string :suppl_name
      t.string :made
      t.string :flavor
      t.integer :price
      t.string :price_tag
      t.integer :use_time
      t.integer :calorie
      t.float :lipid
      t.float :carbo
      t.float :protein
      t.text :img
      t.string :url

      t.timestamps
    end
  end
end
