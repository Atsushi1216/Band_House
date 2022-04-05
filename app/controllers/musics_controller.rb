class MusicsController < ApplicationController
  before_action :find_music, only: [:show, :edit, :update]

  def show
    @comment = Comment.new
  end

  def index
    @musics = Music.page(params[:page]).reverse_order
    @user = current_user
    #ランキング機能music_idをもってきて、favoritecountを表示。表示数を3件
    @all_ranks = Music.find(Favorite.group(:music_id).order('count(music_id) desc').limit(3).pluck(:music_id))
  end

  def new
    # Musicの新規投稿について定義
    @music = Music.new
  end

  def create
    @music = Music.new(music_params)
    # current_userをuserに紐づいているmusicと結びつける
    @music.user_id = current_user.id
    if @music.save
      redirect_to musics_path, notice: '投稿しました。'
      #binding.pry
    else
      render :new
    end
  end


  def edit
  end

  def update
    if @music.update(music_params)
      redirect_to music_path(@music.id), notice: '編集しました。'
    else
      render :edit
    end
  end

  def destroy
    @music = Music.find(params[:id])
    @music.destroy
    redirect_to musics_path
  end

  private
  def music_params
    params.require(:music).permit(:title, :caption, :song, :song_image, :user_id, :evaluation)
  end

  def find_music
    @music = Music.find(params[:id])
  end

end
