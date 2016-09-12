require 'rails_helper'

RSpec.describe "When a user tries to add points to their account" do
  it "they see a 404" do
    user = User.create(username: "User")
    ApplicationController.any_instance.stubs(:current_user).returns(user)

    expect {
      visit "/admin/users/#{user.id}/edit"
    }.to raise_error(ActionController::RoutingError)
  end
end
