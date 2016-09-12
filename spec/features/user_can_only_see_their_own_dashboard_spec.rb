require 'rails_helper'

RSpec.describe "When a user visits another user's dashboard" do
  it "they see their own dashboard" do
    user1 = User.create(username: "User1")
    user2 = User.create(username: "User2")
    ApplicationController.any_instance.stubs(:current_user).returns(user1)

    visit "/users/#{user2.id}"

    expect(page).to have_content("User1")
  end
end
