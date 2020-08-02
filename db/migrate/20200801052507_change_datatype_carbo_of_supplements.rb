class ChangeDatatypeCarboOfSupplements < ActiveRecord::Migration[5.2]
  def change
    change_column :supplements, :carbo, :float
  end
end
