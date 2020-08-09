class CreateFlavorTags < ActiveRecord::Migration[5.2]
  def change
    create_table :flavor_tags do |t|
      t.string :content

      t.timestamps
    end
  end
end
