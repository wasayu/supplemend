class FlavorTag < ApplicationRecord
    has_many :suppl_flavors
    has_many :supplements, through: :suppl_flavors, source: :supplement
end
