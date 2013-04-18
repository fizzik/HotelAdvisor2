class Address < ActiveRecord::Base
   attr_accessible :hotel_id, :country, :state, :city, :street
  belongs_to :hotel

  validates :hotel_id, presence: true
end
