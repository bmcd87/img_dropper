class UsersController < ApplicationController
  def new
    @user = User.new

    render :new
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      self.current_user = @user
      redirect_to user_url(@user), notice: "User Created"
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])

    render :show
  end
end