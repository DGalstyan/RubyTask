require 'rails_helper'

RSpec.describe Admin::UsersController do
  let(:user) { create :user } # create guest user for testing
  let(:admin) { create :admin } # create admin user for testing

  before do
    sign_in admin # sign in with admin user
  end

  describe "#index" do
    it "can be accessed by admin" do
      get :index # get index page
      expect(response).to be_success # if user is admin will be show success response
    end

    it "cannot be accessed by guest" do
      sign_in user # sign in with guest user
      get :index # get index page
      expect(response).to_not be_success # if user is not admin will be show failure response
      expect(response).to redirect_to(root_url) # and will be redirect to root url
    end
  end
end
