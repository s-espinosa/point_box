require 'rails_helper'

RSpec.describe "When an admin removes points" do
  it "a users points are decreased" do
    admin = User.create(username: "Admin", role: 1)
    user  = User.create(username: "User")
    user.update(points: 1)
    ApplicationController.any_instance.stubs(:current_user).returns(admin)

    visit "/admin/users/#{user.id}/edit"
    click_on "Remove a point"

    user.reload
    expect(page).to have_content("Points: 0")
    expect(user.points).to eq(0)
  end
end
