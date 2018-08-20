class Ability
  include CanCan::Ability

  def initialize(user)
    # clear_aliased_actions use this to clear needless aliases like create => new
    @user ||= user || User.new(role: 'guest') # guest user

    guest_access if @user.guest?
    admin_access if @user.admin?
  end

private

  def guest_access; end

  def admin_access
    can :manage, :all
  end
end
