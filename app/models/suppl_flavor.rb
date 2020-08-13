class SupplFlavor < ApplicationRecord
  belongs_to :supplement
  belongs_to :flavor_tag
end
