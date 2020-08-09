class Menu < ApplicationRecord
  belongs_to :user
  belongs_to :suggestion
  
  has_many :suppl_menus
  has_many :select_suppls, through: :suppl_menus, source: :supplement
  
  def suppl_save(supplement)
    self.suppl_menus.build(supplement_id: supplement.id)
  end
end
