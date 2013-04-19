require 'spec_helper'

describe Hotel do
  before do
    @hotel = Hotel.new(user_id: "1", room_description: "Very nice room", title: "Hotel Plazza", breackfast: "Included",
                        price: "200", image: 'photo.jpg', country: "Ukraine", city: "Uzhorod", state: "Transkarpation", street: "Shevchenka 20")
  end


  subject { @hotel }

  it { should respond_to(:breackfast) }
  it { should respond_to(:user_id) }
  it { should respond_to(:room_description) }
  it { should respond_to(:title) }
  it { should respond_to(:price) }
  it { should respond_to(:image) }
  it { should respond_to(:city) }
  it { should respond_to(:country) }
  it { should respond_to(:state) }
  it { should respond_to(:street) }


  describe "User_id is not present" do
    before { @hotel.user_id = nil }
    it { should_not be_valid }
  end

  describe "title is too long" do
    before { @hotel.title = "a" * 141 }
    it { should_not be_valid }
  end

  describe "Room description is too long" do
    before { @hotel.room_description = "a" * 10001 }
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
