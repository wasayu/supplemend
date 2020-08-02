class ChangeDatatypeProteinOfSupplements < ActiveRecord::Migration[5.2]
  def change
    change_column :supplements, :protein, :float
  end
end
