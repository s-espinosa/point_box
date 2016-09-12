require 'rails_helper'

RSpec.describe "When a user tries to create a reward" do
  it "they see a 404" do
    user = User.create(username: "User")
    ApplicationController.any_instance.stubs(:current_user).returns(user)

    expect {
      visit "/admin/rewards/new"
    }.to raise_exception(ActionController::RoutingError)
  end
end
