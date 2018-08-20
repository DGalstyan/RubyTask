require 'rails_helper'

RSpec.describe HomeController do
  it "#index" do
    get :index
    expect(response).to be_success
  end

  def sign_in(user)
    allow(request.env['warden']).to receive(:authenticate!).and_return(user)
    allow(request.env['warden']).to receive(:authenticate?).and_return(user.present?)
    allow(controller).to receive(:current_user).and_return(user)
  end
end
