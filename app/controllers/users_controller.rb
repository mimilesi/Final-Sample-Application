class UsersController < ApplicationController
  before_filter :authenticate, :only => [:edit, :update]
  before_filter :correct_user, :only => [:edit, :update]

  def new
    @title = "Sign Up"
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @title = @user.name
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      @title = "Sign Up"
      @user.password = nil
      @user.password_confirmation = nil
      render 'new'
    end
  end
  
  def edit
    @title = "Edit User"
  end

  def update
    if @user.update_attributes(params[:user])
      sign_in @user
      flash[:success] = "Your profile has been updated."
      redirect_to @user
    else
      @title = "Edit User"
      @user.password = nil
      @user.password_confirmation = nil
      render 'edit'
    end
  end
  
  private
    
    def authenticate
      deny_access unless signed_in?
    end
    
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
  
end
