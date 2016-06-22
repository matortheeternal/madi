class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    # custom actions
    can :assign_roles, User if user.admin?

    # resource permissions
    can [:read, :update], User, :id => user.id
    if user.admin?
      can :manage, :all
      can :request_files
    elsif user.confirmed?
      can [:read, :update], MergePluginsStatistic, :user_id => user.id
      can [:read, :update], MatorSmashStatistic, :user_id => user.id
      can [:read, :create], MergeReport
      can [:read, :create], SmashReport
      can [:read, :create], SmashSetting
      can :request_files
    else
      can :read, MergeReport
      can :read, SmashReport
      can :read, SmashSetting
      can :read, Version
    end
  end
end
