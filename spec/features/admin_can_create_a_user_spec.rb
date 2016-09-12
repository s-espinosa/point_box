require 'rails_helper'

RSpec.describe "When an admin creates a user" do
  it "they see the new user's show page" do
    admin = User.create(username: "Admin", role: 1)
    ApplicationController.any_instance.stubs(:current_user).returns(admin)

    visit "/admin/users/new"
    fill_in "user[username]", with: "New User"
    fill_in "user[points]", with: 0
    click_on "Create User"

    expect(page).to have_content("New User")
    expect(page).to have_content("Points: 0")
  end
end
