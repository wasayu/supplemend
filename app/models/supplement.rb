class Supplement < ApplicationRecord
  belongs_to :flavor_tag
  has_many :favorites, dependent: :destroy
  has_many :suggest_details
  
  has_many :suppl_flavors
  has_many :flavor_tags, through: :suppl_flavors, source: :flavor_tag
  
  # 今後お気に入りされている数を数えるためのコードを書く。
end
