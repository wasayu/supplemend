class ChangeDatatypeImgOfSupplements < ActiveRecord::Migration[5.2]
  def change
    change_column :supplements, :img, :text
  end
end
