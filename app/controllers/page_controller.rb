class PageController < ApplicationController

  def index
     @hotels = Hotel.all.sort_by{|hotel| -hotel.average_rating}
  end

end
