class CreateSuggestions < ActiveRecord::Migration[5.2]
  def change
    create_table :suggestions do |t|
      t.text :content
      t.string :purpose
      t.integer :budget
      t.string :protein_flavor
      t.string :amino_flavor

      t.timestamps
    end
  end
end
