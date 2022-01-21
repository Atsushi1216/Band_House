class Music < ApplicationRecord

mount_uploader :song, AudiofileUploader

  belongs_to :user
  attachment :song_image
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def self.search(search, word)
    if word == ""
      @music = []
    elsif search == "perfect_match"
      @music = Music.where(title: word)
    elsif search == "partial_match"
      @music = Music.where("title LIKE?","%#{word}%")
    else
      @music = Music.all
    end
  end

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  validates :evaluation, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1
  }

  validates :title, length: { in: 2..50 }, presence: true
  validates :caption, length: { in: 2..100 }, presence: true
  validates :song, presence: true

end