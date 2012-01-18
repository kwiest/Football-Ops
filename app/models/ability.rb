class Ability
  include CanCan::Ability
  
  def initialize(user)
    # If there is no signed-in user, they cannot see anything
    if user.nil?
      can :create, User
      can :read, Job
    elsif user.admin?
      # Admins can do anything
      can :manage, :all
    elsif user.conference_rep?
      # Conference reps can manage users
      can :manage, User
    elsif user.national_committee?
      # National committee members can manage users
      can :manage, User
    else
      # All signed-in users can view all records
      can :read, :all
      
      # Users can only update their own profile
      can :edit, User do |u|
        u == user
      end
      
      # Users can upload files, and manage them if they created them
      can :create, Upload
      can :manage, Upload do |upload|
        upload.user == user
      end
      
      # Users can create/update job postings
      can :create, Job
      can :update, Job do |job|
        job.user == user
      end
      can :delete, Job do |job|
        job.user == user
      end
    end
  end
end
