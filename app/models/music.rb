class Music < ApplicationRecord

mount_uploader :song, AudiofileUploader

  belongs_to :user
  attachment :song_image

end
