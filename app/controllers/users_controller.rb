class UsersController < ApplicationController
  #before_action :set_user, only: [:favorites]

  def show
    @user = User.find(params[:id])
    @musics = @user.musics.page(params[:page]).reverse_order
    @feeds = Music.where(user_id: [current_user.id, *current_user.following_user_ids]).order(created_at: :desc)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: 'ユーザー情報を編集しました。'
    else
      render :edit
    end
  end

  def music
    @user = User.find(params["user_id"])
    @musics = @user.musics.page(params[:page]).reverse_order
    @feeds = Music.where(user_id: [current_user.id, *current_user.following_user_ids]).order(created_at: :desc)
    @following_users = @user.following_user
    @follower_users = @user.follower_user
  end

  def favorites
    @user = User.find(params["user_id"])
    favorites = Favorite.where(user_id: @user.id).pluck(:music_id)
    @favorite_musics = Music.find(favorites)
  end

  def follows
    user = User.find(params[:id])
    @users = user.following_user.page(params[:page]).per(3).reverse_order
  end

  def followers
    user = User.find(params[:id])
    @users = user.follower_user.page(params[:page]).per(3).reverse_order
  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  # def set_user
  #   @user = User.find(params["user_id"])
  #   binding.pry
  # end

end
