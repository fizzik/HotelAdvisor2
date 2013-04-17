class Comment < ActiveRecord::Base
  attr_accessible :content, :hotel_id, :user_id

  belongs_to :hotel
  belongs_to :user

  validates :user_id, :hotel_id, presence: true
  validates :content, presence: true, length: { maximum: 240 }


  scope :desc, order("created_at DESC")
end
