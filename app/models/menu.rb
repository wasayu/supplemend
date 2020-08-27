class Menu < ApplicationRecord
  belongs_to :user
  belongs_to :suggestion
  
  has_many :suppl_menus, dependent: :destroy
  has_many :select_suppls, through: :suppl_menus, source: :supplement
  
  def suppl_save(supplement)
    self.suppl_menus.build(supplement_id: supplement.id)
  end
  
  def total_price
    before_suppls = self.select_suppls
    result = 0
    before_suppls.each do |supplement|
      result += supplement.price
    end
    return result
  end
  
end
