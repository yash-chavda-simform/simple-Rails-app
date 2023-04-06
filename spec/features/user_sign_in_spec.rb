require 'rails_helper'


RSpec.feature "User sign in", type: :feature do
  user = UserRendering.create(email: "yash2@gmail.com",password:"123456")
  it "user signs in with valid credentials" do
    visit new_user_rendering_session_path
   
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password

    
    click_button "Log in"
    
    expect(page).to have_current_path(root_path)
  end
end
