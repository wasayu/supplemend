class Supplement < ApplicationRecord
  has_many :favorites
  # 今後お気に入りされている数を数えるためのコードを書く。
end
