class RemoveProteinFlavorFromSuggestions < ActiveRecord::Migration[5.2]
  def change
    remove_column :suggestions, :protein_flavor, :string
    remove_column :suggestions, :amino_flavor,:string
  end
end
