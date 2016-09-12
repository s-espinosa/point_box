class User < ActiveRecord::Base
  has_many :rewards
  enum role: ["default", "admin"]

  def adjust_points(num)
    points + num
  end
end
