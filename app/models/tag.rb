class Tag < ApplicationRecord
  has_many :suppl_tags
  has_many :supplements, through: :suppl_tags, source: :supplement
end
