class SupplMenu < ApplicationRecord
  belongs_to :menu
  belongs_to :supplement
  
  def select(supplement, update_suppl)
    select_suppl = self.suppl_menus.find_by(supplement_id: supplement.id)
    select_suppl.update(supplement_id: update_suppl.id) if select_suppl
  end
end
