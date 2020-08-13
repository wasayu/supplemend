class RemoveFlavorTagIdSupplements < ActiveRecord::Migration[5.2]
  def change
    remove_column :supplements, :flavor_tag_id, :references
  end
end
