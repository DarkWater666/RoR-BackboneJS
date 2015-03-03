class Ability

  include CanCan::Ability

  def initialize(current_user)

    alias_action :create, :read, :update, :destroy, :to => :crud

    current_user ||= User.new # guest user


    if current_user.has_role?(:super_admin)
      super_admin
    elsif current_user.has_role?(:admin)
      admin
    elsif current_user.has_role?(:manager)
      manager
    elsif current_user.has_role?(:noble)
      noble
    elsif current_user.has_role?(:user)
      user
    elsif current_user.has_role?(:banned)
      banned
    else
      can :manage, :Home
      cannot :read, :Admin
    end

  end

  private

    def super_admin
      admin
    end

    def admin
      can :manage, :Admin
      manager
    end

    def manager
      noble
    end

    def noble
      user
    end

    def user
      banned
    end

    def banned
      can :manage, :Home
    end

end
