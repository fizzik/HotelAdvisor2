require 'spec_helper'

describe Comment do
  before do
    @comment = Comment.new(user_id: "1", hotel_id: "2", content: "Simple comment")
  end

  subject { @comment }

  it { should respond_to(:content) }
  it { should respond_to(:user_id) }
  it { should respond_to(:hotel_id) }

  describe "User_id is not present" do
    before { @comment.user_id = nil }
    it { should_not be_valid }
  end

  describe "title is too long" do
    before { @comment.content = "a" * 241 }
    it { should_not be_valid }
  end

  describe "Hotel_id is not present" do
    before { @comment.hotel_id = nil }
    it { should_not be_valid }
  end

end
