# The Ability class is where all user permissions are defined.
class Ability
  include CanCan::Ability

  def initialize(user)
    # clear_aliased_actions use this to clear needless aliases like create => new
    @user ||= user || User.new(role: 'guest') # # user can perform any action on any object

    guest_access if @user.guest?
    admin_access if @user.admin?
  end

private

  def guest_access; end

  def admin_access
    can :manage, :all # user can perform any action on any object
  end
end
