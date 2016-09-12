require 'rails_helper'

RSpec.describe "When an admin gives a user points" do
  it "the users point total increases" do
    admin = User.create(username: "Admin", role: "1")
    user  = User.create(username: "User")
    ApplicationController.any_instance.stubs(:current_user).returns(admin)

    visit "/admin/users/#{user.id}/edit"
    expect(page).to have_content("Points: 0")
    click_on "Add a point"

    user.reload
    expect(page).to have_content("Points: 1")
    expect(user.points).to eq(1)
  end
end
