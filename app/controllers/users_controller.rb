class UsersController < ApplicationController
  def show
    if current_user
      @user = User.find(current_user[:id])
    else
      render_404
    end
  end
end
