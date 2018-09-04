require "spec_helper"
# check registration
describe Users::RegistrationsController do
  let(:user) { create :user, password: 'P@ssw0rd!' } # create guest user for testing

  before do
    @request.env['devise.mapping'] = Devise.mappings[:user] # create devise configuration
  end

  # valid user parameters
  let(:valid_user_params) do
    {
      email: 'somenewemail@example.com',
      password: 'Qw123456'
    }
  end

  describe "#create" do
    it "works" do
      post :create, user: valid_user_params # create user with valid parameters
      expect(flash[:error]).to eq nil # if application works will not be show error message
      user = assigns(:user) # get user
      expect(user.email).to eq 'somenewemail@example.com'
      expect(response).to redirect_to root_url # check redirect url
      expect(controller.signed_in?).to eq true # check is user signed in
      expect(controller.current_user).to eq user # check signed user data is right
    end
  end

  it '#destroy' do
    sign_in user # sign in with user
    delete :destroy # logout
    expect(response).to redirect_to root_url # check redirect url
  end
end
