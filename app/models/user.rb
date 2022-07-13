class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :profile_image
  
  has_many :posts, dependent: :destroy
  has_many :buyed_posts, foreign_key: "buyer_id", class_name: "Post"
  has_many :sold_posts, -> { where("buyer_id is not NULL") }, foreign_key: "saler_id", class_name: "Post"
  has_many :likes, dependent: :destroy
  has_many :orders, dependent: :destroy

  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followings, through: :relationships, source: :followed
  has_many :followers, through: :reverse_of_relationships, source: :follower

  def follow(user)
    relationships.create(followed_id: user.id)
  end

  def unfollow(user)
    relationships.find_by(followed_id: user.id).destroy
  end

  def following?(user)
    followings.include?(user)
  end



  def self.search(search, keyword)
    if search != ""
      @user = User.where(["name LIKE(?)", "%#{keyword}%"])
    else
      @user = User.all
    end
  end

  def get_profile_image
    (profile_image.attached?)? profile_image: "no-image-icon.jpg"
  end

end
