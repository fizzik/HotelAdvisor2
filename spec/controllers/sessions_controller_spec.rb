require 'spec_helper'


describe "Signing", :type => :feature do
  before :each do
   @user = User.new(:email => 'vitaleks2012@i.ua', :password => '123456')
  end

  it "Sign up" do
    visit '/signup' do
      fill_in 'name', :with => 'Vitaleks'
      fill_in 'email', :with => 'vitaleks2012@i.ua'
      fill_in 'password', :with => '123456'
      fill_in 'password_confirmation', :with => '123456'
      click_link 'Create my account'
    end
    page.should have_content 'Sign up'
  end

  it "Home page" do
    visit '/' do
      click_link 'Home'
    end
    page.should have_content 'HotelAdvisor'
  end

  it "Signout" do
    visit '/' do
      click_link 'Sign out'
    end
    page.should have_content 'HotelAdvisor'
  end

  it "Sign in" do
    visit '/signin' do
      fill_in 'email', :with => 'vitaleks2012@i.ua'
      fill_in 'password', :with => '123456'
    end
    click_link 'Sign in'
    page.should have_content 'Sign in'
  end

  it "Create Hotel" do
    visit '/hotels/new' do
      fill_in 'title', :with => 'Hotel Plazza'
      fill_in 'room_description', :with => 'Very nice hotel'
      fill_in 'price', :with => '250'
      fill_in 'country', :with => 'Ukraine'
      fill_in 'state', :with => 'Transkarpatia'
      fill_in 'city', :with => 'Uzhorod'
      fill_in 'street', :with => 'Shevchenka 10'
      click_link "Create"
    end
    page.should have_content 'HotelAdvisor'
  end

  it "Settings" do
    visit '/' do
      click_on "Settings"
      fill_in 'title', :with => 'Hotel Plazza'
      fill_in 'room_description', :with => 'Very nice hotel'
      fill_in 'price', :with => '250'
      fill_in 'country', :with => 'Ukraine'
      fill_in 'state', :with => 'Transkarpatia'
      fill_in 'city', :with => 'Uzhorod'
      fill_in 'street', :with => 'Shevchenka 10'
      click_link "Save changes"
    end
    page.should have_content 'HotelAdvisor'
  end
end
