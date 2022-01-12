class UsersController < ApplicationController
  def show
     @user = User.find(params[:id])
     @musics = @user.musics.page(params[:page]).reverse_order
     @feeds = Music.where(user_id: [current_user.id, *current_user.follower_ids]).order(created_at: :desc)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def followings
    user = User.find(params[:id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:id])
    @users = user.followers
  end
end
