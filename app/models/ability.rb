class Ability
  include CanCan::Ability

  def initialize(user)
    # Allow admins to manage all models and controllers
    if user.permission_level >= 2
      can :manage, :all
    end

    # Allow report users to create reports
    if user.permission_level >= 1
      can :location, :report
    end

    # Allow all users to view models and update expiries
    can :read, Location
    can :read, Item
    can :read, StockItem
    can :save_expiries, Item
    can :location, :stock_take
  end
end
