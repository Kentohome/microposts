class UsersController < ApplicationController
    include SessionsHelper
    before_action :set_user, only: [:edit, :update]
    
  def new
    @user = User.new
  end
  
  def show 
   @user = User.find(params[:id])
    @microposts = @user.microposts.order(created_at: :desc)
  end
  
   def create
    @user = User.new(user_params)
    if @user.save
       flash[:success] = "Welcome to the Sample App!"
       redirect_to @user
    else
      render 'new'
    end
   end
  
  def edit
      if logged_in?
      end
  end
  
  def update
      if logged_in?
          if @user.update(user_params)
              redirect_to @user, notice: '更新しました'
          else render 'edit'
          end
      end
  end
      
  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation, :birthday, :address)
  end
  
  def set_user
  @user = User.find(params[:id])
  end
end
