class Admin::UsersController < Admin::BaseController
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    render :edit
  end

  private
  def user_params
    params.require(:user).permit(:points)
  end
end
