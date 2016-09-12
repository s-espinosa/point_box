require 'rails_helper'

RSpec.describe "When a user visits their dashboard" do
  it "it exists" do
    user = User.create(username: "User")
    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit "/users/#{user.id}"
    expect(page).to have_content("Dashboard")
  end

  it "they can see their points" do
    user = User.create(username: "User")
    user.update(points: 1)
    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit "/users/#{user.id}"

    expect(page).to have_content("Points: 1")
  end
end
