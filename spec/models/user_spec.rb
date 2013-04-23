require 'spec_helper'

describe User do

  before do
    @user = User.new(name: "Vitaleks", email: "vitaleks2012@i.ua")
  end

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:remember_token) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }

  #Testing association and validation(shoulda-matchers)

  it { should have_many(:comment) }
  it { should have_many(:hotel) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }
  it { should validate_presence_of(:password_confirmation) }
  it { should validate_uniqueness_of(:email) }
  it { should_not allow_value("/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i").for(:email) }
  it { should allow_value("vitaleks2012@i.ua").for(:email) }
  it { should allow_value("123456").for(:password) }
  it { should_not allow_value("12345").for(:password) }
  it { should allow_value("123456").for(:password_confirmation) }
  it { should_not allow_value("111111111111111111111").for(:name) }


  describe "Email address is already taken" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.save
    end

    it { should_not be_valid }
  end

  describe "Email address is already taken" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.email = @user.email.upcase
      user_with_same_email.save
    end

    it { should_not be_valid }
  end


  describe "Password doesn't match confirmation" do
    before { @user.password_confirmation = "vitaleks" }
    it { should_not be_valid }
  end





end
