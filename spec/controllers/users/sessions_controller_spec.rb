require 'rails_helper'

RSpec.describe Users::SessionsController do
  let(:user) { create :user, password: "P@ssw0rd!" } # create guest user for testing

  before do
    @request.env["devise.mapping"] = Devise.mappings[:user]  # create devise configuration
  end

  it "#login" do
    post :create, user: {email: user.email, password: "P@ssw0rd!"}  # login with valid user
    expect(response).to redirect_to root_url  # check redirect url
    expect(controller.current_user).to eq user # check signed user data is right
  end

  it "#logout" do
    sign_in user # sign in with user
    delete :destroy # logout
    expect(response).to redirect_to root_url  # check redirect url
    expect(controller.current_user).to eq nil
  end
end
