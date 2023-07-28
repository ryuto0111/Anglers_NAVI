class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @user = User.page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order(created_at: :desc).page(params[:page]).per(6)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "ユーザー情報の更新に成功しました。"
      redirect_to admin_user_path(@user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :email, :is_deleted)
  end

end
