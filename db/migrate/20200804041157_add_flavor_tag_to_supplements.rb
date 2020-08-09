class AddFlavorTagToSupplements < ActiveRecord::Migration[5.2]
  def change
    add_reference :supplements, :flavor_tag, foreign_key: true
  end
end
