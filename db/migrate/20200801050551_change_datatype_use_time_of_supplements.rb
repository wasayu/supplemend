class ChangeDatatypeUseTimeOfSupplements < ActiveRecord::Migration[5.2]
  def change
    change_column :supplements, :use_time, :integer
  end
end
