class HomeController < ApplicationController
  before_action :admin?

  def index
    @user = current_user
  end

  def admin?
    # check if user is a admin
    redirect_to admin_users_path if current_user.present? && current_user.admin?
  end
end
