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

  #Testing association and validation(shoulda-matchers)

  it { should belong_to(:user) }
  it { should have_many(:comment) }
  it { should have_many(:ratings) }

  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:title) }
  it { should validate_numericality_of(:price) }
  it { should allow_value("3").for(:user_id) }
  it { should_not allow_value(" ").for(:user_id) }
  it { should allow_value("Hotel").for(:title) }
  it { should_not allow_value(" ").for(:title) }
  it { should allow_value("Description hotel").for(:room_description) }

  describe "title is too long" do
    before { @hotel.title = "a" * 141 }
    it { should_not be_valid }
  end

  describe "Room description is too long" do
    before { @hotel.room_description = "a" * 10001 }
    it { should_not be_valid }
  end



end
