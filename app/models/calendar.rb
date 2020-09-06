class Calendar < ApplicationRecord
  belongs_to :user
  belongs_to :supplement
  
  validates :content, length: { maximum: 255 }
  
  def start_time
    self.start_day
  end
  
  def end_time
    self.end_day
  end
  
end
