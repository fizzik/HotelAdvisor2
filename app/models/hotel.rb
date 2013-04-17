class Hotel < ActiveRecord::Base
  attr_accessible :breackfast, :price, :room_description, :title, :user_id, :image
  belongs_to :user
  has_many :comment

  mount_uploader :image, ImageUploader

  HOTEL_BREACKFAST = ["Yes", "No"]

  validates :user_id, presence: true
  validates :room_description, length: { maximum: 5000 }
  validates :title, length: { maximum: 140 }
  validates :price, :numericality => {greater_than_or_equal_to: 0.01}
end
