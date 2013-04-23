class Hotel < ActiveRecord::Base
  attr_accessible :breackfast, :price, :room_description, :title, :user_id, :image, :address_attributes
  belongs_to :user
  has_many :comment
  has_many :ratings,  dependent: :destroy
  has_one  :address,  dependent: :destroy

  accepts_nested_attributes_for :address


  mount_uploader :image, ImageUploader

  HOTEL_BREACKFAST = ["Yes", "No"]

  validates :user_id, presence: true
  validates :room_description, length: { maximum: 10000 }
  validates :title, presence: true, length: { maximum: 140 }
  validates :price, :numericality => {greater_than_or_equal_to: 0.01}

  def rate(user, vote)
    Rating.create(:user_id => user.id, :hotel_id => self.id, :rate => vote)
  end

  def average_rating
    ratings = Rating.find_all_by_hotel_id(self.id)
    return 0 if ratings.length == 0
    (ratings.sum{|r| r.rate})/(ratings.length).round(2)
  end

  def voted_user?(user)
    Rating.where(:user_id => user, :hotel_id => self.id).any?
  end

end
