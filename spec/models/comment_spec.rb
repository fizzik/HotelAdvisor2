require 'spec_helper'

describe Comment do
  before do
    @comment = Comment.new(user_id: "1", hotel_id: "2", content: "Simple comment")
  end

  subject { @comment }

  it { should respond_to(:content) }
  it { should respond_to(:user_id) }
  it { should respond_to(:hotel_id) }

  #Testing association and validation (shoulda-matchers)

  it { should belong_to(:hotel) }
  it { should belong_to(:user) }

  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:hotel_id) }
  it { should validate_presence_of(:content) }
  it { should allow_value("Rails").for(:content) }
  it { should_not allow_value(" ").for(:content)}
  it { should allow_value("1").for(:user_id) }
  it { should allow_value("3").for(:hotel_id) }
  it { should_not allow_value(" ").for(:user_id)}
  it { should_not allow_value(" ").for(:hotel_id) }

  end
