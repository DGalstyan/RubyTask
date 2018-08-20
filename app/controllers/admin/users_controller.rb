class Admin::UsersController < Admin::BaseController
  before_filter :authorize_dashboard

  def index
    @ransack_params = params[:q] || {}
    @ransack = User.ransack(@ransack_params)
    @ransack.sorts = 'email desc' if @ransack.sorts.empty?

    @filtered_users = @ransack.result
    @users = @filtered_users.page(params[:page]).per(3)
  end

private

  def authorize_dashboard
    authorize! :access, Admin::UsersController
  end
end
