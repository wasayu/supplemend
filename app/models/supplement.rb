class Supplement < ApplicationRecord
  belongs_to :flavor_tag
  has_many :favorites, dependent: :destroy
  has_many :suggest_details
  # 今後お気に入りされている数を数えるためのコードを書く。
end
