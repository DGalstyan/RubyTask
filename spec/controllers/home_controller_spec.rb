require 'rails_helper'

RSpec.describe HomeController do
  it "#index" do
    get :index # check is home view is working
    expect(response).to be_success # check response url
  end

  # Sign in user with devise
  def sign_in(user)
    allow(request.env['warden']).to receive(:authenticate!).and_return(user) # check user permision
    allow(request.env['warden']).to receive(:authenticate?).and_return(user.present?)
    allow(controller).to receive(:current_user).and_return(user) # check user permision
  end
end
