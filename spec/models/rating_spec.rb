require 'spec_helper'

describe Rating do
  before do
    @rating = Rating.new(user_id: "1", hotel_id: "2", rate: "2")
  end

  subject { @rating }

  it { should respond_to(:rate) }
  it { should respond_to(:user_id) }
  it { should respond_to(:hotel_id) }

  #Testing association and validation (shoulda-matchers)

  it { should belong_to(:hotel) }

  it { should validate_uniqueness_of(:user_id).scoped_to(:hotel_id) }

end
