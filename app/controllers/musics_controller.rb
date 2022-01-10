class MusicsController < ApplicationController
  before_action :find_music, only: [:show, :edit, :update]

  def show
    #@music_new = Music.new
    #@user = @music.user
    #@post_comment = PostComment.new
  end

  def index
    @musics = Music.all
    @user = current_user
  end

  def new
    @music = Music.new
  end

  def create
    @music = Music.new(music_params)
    @music.user_id = current_user.id
    @music.save
    redirect_to musics_path
  end

  def edit
  end

  def update
    if @music.update(music_params)
      redirect_to music_path(@music.id)
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
    params.require(:music).permit(:title, :caption, :song, :song_image, :user_id)
  end

  def find_music
    @music = Music.find(params[:id])
  end

end
