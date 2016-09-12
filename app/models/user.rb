class User < ActiveRecord::Base
  enum role: ["default", "admin"]

  def adjust_points(num)
    points + num
  end
end
