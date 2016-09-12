require 'rails_helper'

RSpec.describe "When a user visits their dashboard" do
  it "they can see their rewards" do
    user = User.create(username: "User1")
    Reward.create(title: "Reward1", value: 5, user_id: user.id)
    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit "/users/#{user.id}"

    expect(page).to have_content("Reward1")
  end
end
