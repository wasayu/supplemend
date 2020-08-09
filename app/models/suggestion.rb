class Suggestion < ApplicationRecord
  has_many :menus
  has_many :suggest_details
  has_many :suggest_suppls, through: :suggest_details, source: :supplement

end
