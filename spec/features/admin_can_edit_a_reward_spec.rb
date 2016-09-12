require 'rails_helper'

RSpec.describe "When an admin updates a reward" do
  it "they see an updated reward page" do
    admin = User.create(username: "Admin", role: 1)
    reward = Reward.create(title: "Reward", value: 5)
    ApplicationController.any_instance.stubs(:current_user).returns(admin)

    visit "/admin/rewards/#{reward.id}/edit"
    fill_in "reward[title]", with: "New Title"
    fill_in "reward[value]", with: 3
    click_on "Update Reward"

    expect(page).to have_content("New Title")
    expect(page).to have_content("Value: 3")
  end
end
