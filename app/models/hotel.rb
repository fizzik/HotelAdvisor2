class Hotel < ActiveRecord::Base
  include SessionsHelper
  attr_accessible :breackfast, :price, :room_description, :title, :user_id, :image
  belongs_to :user
  has_many :comment
  has_one :address


  mount_uploader :image, ImageUploader

  HOTEL_BREACKFAST = ["Yes", "No"]

  validates :user_id, presence: true
  validates :room_description, length: { maximum: 5000 }
  validates :title, presence: true, length: { maximum: 140 }
  validates :price, :numericality => {greater_than_or_equal_to: 0.01}

  def rate(stars)
    Rating.create(:user_id => @current_user.id, :hotel_id => self.id, :rate => stars.to_i)
  end

  def average_rating
    ratings = Rating.find_all_by_hotel_id(self.id)
    return 0 if ratings.length == 0
    (ratings.sum{|r| r.rate})/(ratings.length).round(2)
  end

  def voted_current_user?
    Rating.where(:user_id => @current_user, :hotel_id => self.id).any?
  end

end
