class CreateSuggestDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :suggest_details do |t|
      t.references :supplement, foreign_key: true
      t.references :suggestion, foreign_key: true

      t.timestamps
    end
  end
end
