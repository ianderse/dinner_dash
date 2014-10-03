class Ability

  include CanCan::Ability

  def initialize( user )
    user ||= User.new

    if user.is? :admin
      can :manage, :all
    else
      can :read, Item
      can :read, Category
      can :create, User

    end
  end

end
