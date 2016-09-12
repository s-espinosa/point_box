class Admin::RewardsController < Admin::BaseController
  def show
    @reward = Reward.find(params[:id])
  end

  def new
    @reward = Reward.new
  end

  def create
    @reward = Reward.new(reward_params)
    if @reward.save
      redirect_to admin_reward_path(@reward)
    end
  end

  def edit
    @reward = Reward.find(params[:id])
  end

  def update
    @reward = Reward.find(params[:id])
    if @reward.update(reward_params)
      redirect_to admin_reward_path(@reward)
    end
  end

  private
  def reward_params
    params.require(:reward).permit(:title, :value)
  end
end
