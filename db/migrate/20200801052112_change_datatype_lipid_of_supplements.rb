class ChangeDatatypeLipidOfSupplements < ActiveRecord::Migration[5.2]
  def change
    change_column :supplements, :lipid, :float
  end
end
