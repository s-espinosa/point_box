require 'rails_helper'

RSpec.describe "When a visitor tries to see a user's dashboard" do
  it "they cannot" do
    user = User.create(username: "User")

    expect {
      visit "/users/#{user.id}"
    }.to raise_error(ActionController::RoutingError)
  end
end
