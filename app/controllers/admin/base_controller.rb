class Admin::BaseController < ApplicationController
  before_action :authorize_admin

  def authorize_admin
    render_404 unless current_user.admin?
  end

end
