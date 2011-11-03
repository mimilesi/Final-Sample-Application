class UsersController < ApplicationController
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
      # TODO handle a successful save
    else
      @title = "Sign Up"
      render 'new'
    end
  end
  
end
