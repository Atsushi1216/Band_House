class Music < ApplicationRecord

mount_uploader :song, AudiofileUploader

  belongs_to :user
  attachment :song_image
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

end