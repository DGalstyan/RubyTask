require 'rails_helper'

RSpec.describe Users::SessionsController do
  let(:user) { create :user, password: "P@ssw0rd!" }

  before do
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end

  it "#login" do
    post :create, user: {email: user.email, password: "P@ssw0rd!"}
    expect(response).to redirect_to root_url
    expect(controller.current_user).to eq user
  end

  it "#logout" do
    sign_in user
    delete :destroy
    expect(response).to redirect_to root_url
    expect(controller.current_user).to eq nil
  end
end
