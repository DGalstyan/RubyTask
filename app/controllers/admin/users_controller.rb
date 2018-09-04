class Admin::UsersController < Admin::BaseController
  before_filter :authorize_dashboard

  def index
    # using a "ransacker" (a virtual, searchable "column") to allow searching on email and role.
    @ransack_params = params[:q] || {}
    # attributes allowed for searching using ransackable_attributes.
    @ransack = User.ransack(@ransack_params)
    # attributes allowed for sorting using ransortable_attributes.
    @ransack.sorts = 'email desc' if @ransack.sorts.empty?

    @filtered_users = @ransack.result
    # returns searched and sorted users
    @users = @filtered_users.page(params[:page]).per(3)
  end

private

  def authorize_dashboard
    authorize! :access, Admin::UsersController # check is user have access.
  end
end
