class Rating < ActiveRecord::Base

  attr_accessible :rate, :user_id, :hotel_id

  belongs_to :hotel

  validates_uniqueness_of :user_id, :scope => :hotel_id

end