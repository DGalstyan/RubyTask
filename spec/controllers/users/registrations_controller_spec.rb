require "spec_helper"

describe Users::RegistrationsController do
  let(:user) { create :user, password: 'P@ssw0rd!' }

  before do
    @request.env['devise.mapping'] = Devise.mappings[:user]
  end

  let(:valid_user_params) do
    {
      email: 'somenewemail@example.com',
      password: 'Qw123456'
    }
  end

  describe "#create" do
    it "works" do
      post :create, user: valid_user_params
      expect(flash[:error]).to eq nil
      user = assigns(:user)
      expect(user.email).to eq 'somenewemail@example.com'
      expect(response).to redirect_to root_url
      expect(controller.signed_in?).to eq true
      expect(controller.current_user).to eq user
    end
  end

  it '#destroy' do
    sign_in user
    delete :destroy
    expect(response).to redirect_to root_url
  end
end
