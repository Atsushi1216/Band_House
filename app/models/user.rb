class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :musics, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  has_many :relationships, foreign_key: :follower_id
  has_many :followers, through: :relationships, source: :followed
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: :followed_id
  has_many :followeds, through: :reverse_of_relationships, source: :follower

  attachment :profile_image

  def self.search(search,word)
    if search == "forward_match"
      @user = User.where("name LIKE?","#{word}%")
    elsif search == "backward_match"
      @user = User.where("name LIKE?","%#{word}")
    elsif search == "perfect_match"
      @user = User.where("#{word}")
    elsif search == "partial_match"
      @user = User.where("name LIKE?","%#{word}%")
    else
      @user = User.all
    end
  end

  def is_followed_by?(user)
    reverse_of_relationships.find_by(follower_id: user.id).present?
  end

end
