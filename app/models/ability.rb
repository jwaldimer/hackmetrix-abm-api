class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.present?
      if user.admin?
        can :manage, User
        can :manage, Article
      elsif user.role1?
        can :read, User, id: user.id
        can :read, Article
      else
        can :read, User, id: user.id
        can :read, Article, user_id: user.id
      end
    end
  end
end
