class Supplement < ApplicationRecord
  has_many :favorites, dependent: :destroy
  has_many :suggest_details, dependent: :destroy
  
  has_many :calendars, dependent: :destroy
  
  has_many :suppl_flavors
  has_many :flavor_tags, through: :suppl_flavors, source: :flavor_tag
  
  has_many :suppl_tags
  has_many :tags, through: :suppl_tags, source: :tag
  
end
