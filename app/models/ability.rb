 # frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # TODO: define granular permissions per user type.
    # Hint: inspect the class name of the current user
    # You get the current user object simply by calling
    # current_user. The class name of any Ruby object
    # can be obtained by calling _object_.class.name,
    # where in _object_ is any valid Ruby object.

    can :read, Event

    # Unregistered users should only be able to read Events.
    if user.present?
      can :manage, EventCreator, user_id: user.id
      can :manage, GuestList, user_id: user.id
      can :manage, MembersList, user_id: user.id

    else
      can :manage, :all
    end
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

