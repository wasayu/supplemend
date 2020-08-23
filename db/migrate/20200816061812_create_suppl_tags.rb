class CreateSupplTags < ActiveRecord::Migration[5.2]
  def change
    create_table :suppl_tags do |t|
      t.references :supplement, foreign_key: true
      t.references :tag, foreign_key: true
      t.boolean :primary_tag, default: false, null: false

      t.timestamps
      t.index [:supplement_id, :tag_id], unique: true
      t.index [:supplement_id, :primary_tag], unique: true
    end
  end
end
