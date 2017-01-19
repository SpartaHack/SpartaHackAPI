class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.has_role? :director
      can :manage, :all
      # elsif user.has_role? :judge
      # elsif user.has_role? :mentor
      # elsif user.has_role? :sponsor
    elsif user.has_role? :organizer
      can :manage, Faq
      can :manage, Sponsor
      can :manage, Category
      can :manage, Schedule
      can :manage, Hardware
      can :checkin_index, User
      can :checkin_create, User
      can :destroy_create, User
      # elsif user.has_role? :volunteer
    elsif user.has_role? :hacker
      can :update, User, :id => user.id
      can :read, User, :id => user.id
      can :destroy, User, :id => user.id
      can :create, Installation
      can :read, Installation, :user_id => user.id
      can :update, Installation, :user_id => user.id
      can :destroy, Installation, :user_id => user.id
      can :manage, Application, :user_id => user.id
      can :manage, Rsvp, :user_id => user.id
      can :read, [Faq, Sponsor]
      cannot :index, User
      cannot :index, Installation
      can    :read, Category
      can    :index, Category
    else # Just API Token
      cannot :manage, [User, Application, Rsvp, Faq, Sponsor]
      can :read, :all
      can :request_password_token, User
      can :reset_password, User
      can :create, User
      can :read, User
      can :create, Installation
      can :read, Installation
      can :read, Category
      can :index, Category
      can :read, Schedule
      can :index, Schedule
      can :read, Hardware
      can :index, Hardware
    end
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
