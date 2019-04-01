class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :all
    return unless user && user.admin?
    can :access, :rails_admin
    can :read, :dashboard
    can :manage, :all
  end
end
