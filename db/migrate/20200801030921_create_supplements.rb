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
      t.string :use_time
      t.integer :calorie
      t.integer :lipid
      t.integer :carbo
      t.integer :protein
      t.string :img
      t.string :url

      t.timestamps
    end
  end
end
