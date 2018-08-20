require 'rails_helper'

RSpec.describe Admin::UsersController do
  let(:user) { create :user }
  let(:admin) { create :admin }

  before do
    sign_in admin
  end

  describe "#index" do
    it "can be accessed by admin" do
      get :index
      expect(response).to be_success
    end

    it "cannot be accessed by guest" do
      sign_in user
      get :index
      expect(response).to_not be_success
      expect(response).to redirect_to(root_url)
    end
  end
end
