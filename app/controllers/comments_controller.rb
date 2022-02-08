class CommentsController < ApplicationController
  def create
    music = Music.find(params[:music_id])
    #currentuserの新規コメントをcontentと定義
    content = current_user.comments.new(comment_params)
    content.music_id = music.id
    content.save
    redirect_to music_path(music)
  end

  def destroy
    Comment.find_by(id: params[:id]).destroy
    redirect_to music_path(params[:music_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

end
