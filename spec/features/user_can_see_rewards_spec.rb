require 'rails_helper'

RSpec.describe "When a user visits the rewards index" do
  it "they see all the rewards" do
    user = User.create(username: "User")
    Reward.create(title: "Reward1", value: 5)
    Reward.create(title: "Reward2", value: 6)
    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit "/rewards"

    expect(page).to have_content("Reward1")
    expect(page).to have_content("Reward2")
  end
end
