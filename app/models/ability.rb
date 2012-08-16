class Ability
  include CanCan::Ability
  
  def initialize(user)
    if user
      # All signed-in users can view all records
      can :read, :all
      
      # Users can only update their own profile
      can :edit, User do |u|
        u == user
      end
      
      if user.admin?
        # Admins can manage everything
        can :manage, :all
      end

      if user.conference_rep?
        # Conference reps can manage users
        can :manage, User
      end

      if user.national_committee?
        # National committee members can manage users
        can :manage, User
      end
    end

    # If there is no signed-in user, they cannot see anything
    if user.nil?
      can :create, User
    end
  end
end
