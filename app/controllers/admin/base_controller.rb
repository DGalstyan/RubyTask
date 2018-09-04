class Admin::BaseController < ApplicationController
  def current_ability
    @current_ability ||= AdminAbility.new(current_user) # create new user Ability
  end
end
