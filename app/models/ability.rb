class Ability
  include CanCan::Ability

  def initialize(user)
    if user.permission_level >= 2
      can :manage, :all
    end

    if user.permission_level >= 1
      can :stock_item, :report
      can :location, :report
    end

    can :read, Location
    can :read, Item
    can :read, StockItem
    can :manage, ItemExpiry
    can :location, :stock_take
  end
end
