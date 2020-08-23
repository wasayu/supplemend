class Suggestion < ApplicationRecord
  has_many :menus, dependent: :destroy
  has_many :suggest_details, dependent: :destroy
  has_many :suggest_suppls, through: :suggest_details, source: :supplement

end
