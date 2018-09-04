# The Ability class is where all user permissions are defined.
class AdminAbility
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    can :access, Admin::UsersController if user.admin?
    can :manage, :all if user.admin? # user can perform any action on any object
  end
end
