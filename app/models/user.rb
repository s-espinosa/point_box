class User < ActiveRecord::Base
  def adjust_points(num)
    points + num
  end
end
