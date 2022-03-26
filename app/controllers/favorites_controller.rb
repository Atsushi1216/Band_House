class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    # music_idを指定する
    @music = Music.find(params[:music_id])
    favorite = current_user.favorites.new(music_id: @music.id)
    favorite.save
  end

  def destroy
    @music = Music.find(params[:music_id])
    favorite = current_user.favorites.find_by(music_id: @music.id)
    favorite.destroy
  end

end