class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show, :destroy, :likes, :menus] 

  def index
  end

  def show
    @user = User.find(params[:id])
    @menu = @user.menus.where(saving: 1).order(id: :desc).page(params[:page]).per(5)
    @using = @user.using.page(params[:page])
    @calendars = @user.calendars.page(params[:page])
    @likes = @user.likes.page(params[:page])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = '退会しました。'
    redirect_to root_path
  end
  
  def likes
    @user = User.find(params[:id])
    @likes = @user.likes.page(params[:page])
    counts(@user)
  end
  
  def menus
    @user = User.find(params[:id])
    @menu = @user.menus.where(saving: 1).order(id: :desc).page(params[:page]).per(5)
    counts(@user)
  end
  
  def calendars
    @user = User.find(params[:id])
    @using = @user.using.page(params[:page])
    @calendars = @user.calendars.page(params[:page])
    counts(@user)
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
end
