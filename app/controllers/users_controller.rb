class UsersController < ApplicationController
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new user_params
                      
    if @user.save
      flash[:success] = 'User registrated'
      redirect_to root_path
    else
      flash[:danger] = 'Registration failed'
      render :new

    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :passwourd_confirmation)
  end
  
end