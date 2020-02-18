class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:edit]


  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params_create)
    if @user.save
      flash[:success] = '登録完了しました'
      redirect_to root_url
    else
      flash[:danger] = '登録に失敗しました'
      render :new
    end
  end
  
  def edit 
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params_update)
      flash[:success] = '更新に成功しました'
      redirect_to root_url
    else
      flash[:danger] = '更新に失敗しました'
      render :edit
    end
  end
  
  private
  
  def user_params_create
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  def user_params_update
    params.require(:user).permit(:name, :email)
  end
end
