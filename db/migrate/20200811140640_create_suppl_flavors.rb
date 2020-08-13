class CreateSupplFlavors < ActiveRecord::Migration[5.2]
  def change
    create_table :suppl_flavors do |t|
      t.references :supplement, foreign_key: true
      t.references :flavor_tag, foreign_key: true

      t.timestamps
      
      t.index [:supplement_id, :flavor_tag_id], unique: true
    end
  end
end
