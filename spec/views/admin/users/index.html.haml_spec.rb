require "spec_helper"

describe "admin/users/index", type: :view do
  it "renders a list of users" do
    @ransack_params = params[:q] || {}
    @ransack = User.ransack
    @filtered_users = @ransack.result
    @users = @filtered_users.page(1).per(3)
    render
  end
end
