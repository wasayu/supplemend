class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }  
  has_secure_password
  
  has_many :menus, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :likes, through: :favorites, source: :supplement
  has_many :calendars, dependent: :destroy
  has_many :using, through: :calendars, source: :supplement
  
  def like(supplement)
    self.favorites.find_or_create_by(supplement_id: supplement.id)
  end
  
  def unlike(supplement)
    favorite = self.favorites.find_by(supplement_id: supplement.id)
    favorite.destroy if favorite
  end
  
  def like?(supplement)
    self.likes.include?(supplement)
  end
  
end
