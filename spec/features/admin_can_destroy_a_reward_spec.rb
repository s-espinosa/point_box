require "rails_helper"

RSpec.describe "When an admin deletes a reward" do
  it "the reward is destroyed" do
    reward = Reward.create(title: "Reward1", value: 5)
    admin = User.create(username: "Admin", role: 1)
    ApplicationController.any_instance.stubs(:current_user).returns(admin)

    visit "/admin/rewards/#{reward.id}"
    click_on "Delete"

    expect(current_path).to eq("/admin/rewards")
    expect(page).to_not have_content("Reward1")
  end
end
