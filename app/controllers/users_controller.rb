class UsersController < ApplicationController
  before_filter :sign_in_required, :except => [:new, :create]
  before_filter :authorized?, :only => [:edit, :update]
  
  # GET /users
  # GET /users.xml
  def index
    @users = User.all(:include => :school)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find(params[:id], :include => :school)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.xml
  def create
    params[:user][:admin] = false
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        flash[:success] = 'User was successfully created.'
        format.html { redirect_to(@user) }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    respond_to do |format|
      if @user.update_attributes(params[:user])
        flash[:success] = 'User was successfully updated.'
        format.html { redirect_to(@user) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # GET /users/conference_reps
  # GET /users/conference_reps.xml
  def conference_reps
  	@users = User.find_all_by_conference_rep(true)
  end
  
  # GET /users/national_committee
  # GET /users/national_committee.xml
  def national_committee
  	@users = User.find_all_by_national_committee(true)
  end
  
  # GET /users/search
  # GET /users/search.xml
  def search
  	@users = User.all(:conditions => [ "last_name LIKE ?", "%#{params[:last_name]}%" ] )
  	flash[:notice] = "Sorry, no users found by last name: #{params[:last_name]}." unless @users.size > 0
  end
  
  
  private
  
  def authorized?
    @user = User.find(params[:id])
    @user.changeable_by?(current_user) || access_denied
  end
end
