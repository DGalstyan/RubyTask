class AdminAbility
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user

    can :access, Admin::UsersController if user.admin?
    can :manage, :all if user.admin?
  end
end
