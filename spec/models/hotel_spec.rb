require 'spec_helper'

describe Hotel do
  before do
    @hotel = Hotel.new(user_id: "1", room_description: "Very nice room", title: "Hotel Plazza", breackfast: "Included",
                        price: "200", image: 'photo.jpg')
  end


  subject { @hotel }

  it { should respond_to(:breackfast) }
  it { should respond_to(:user_id) }
  it { should respond_to(:room_description) }
  it { should respond_to(:title) }
  it { should respond_to(:price) }
  it { should respond_to(:image) }

  describe "User_id is not present" do
    before { @hotel.user_id = nil }
    it { should_not be_valid }
  end

  describe "title is too long" do
    before { @hotel.title = "a" * 141 }
    it { should_not be_valid }
  end

  describe "title is not present" do
    before { @hotel.title = " " }
    it { should_not be_valid }
  end

  describe "Price is not present" do
    before { @hotel.price = " " }
    it { should_not be_valid }
  end

end
