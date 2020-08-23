class SupplTag < ApplicationRecord
  belongs_to :supplement
  belongs_to :tag
end
