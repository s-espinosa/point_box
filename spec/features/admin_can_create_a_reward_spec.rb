require 'rails_helper'

RSpec.describe "When an admin creates a reward" do
  it "has a show page" do
    admin = User.create(username: "Admin", role: 1)
    ApplicationController.any_instance.stubs(:current_user).returns(admin)

    visit '/admin/rewards/new'
    fill_in('reward[title]', with: "New Reward")
    fill_in("reward[value]", with: "5")
    click_on("Create Reward")

    reward = Reward.last
    expect(current_path).to eq("/admin/rewards/#{reward.id}")
    expect(page).to have_content("New Reward")
    expect(page).to have_content("Value: 5")
  end
end
