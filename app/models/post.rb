class Post < ApplicationRecord
  has_one_attached :image

  default_scope -> { order(updated_at: :desc) }

  belongs_to :user
  # belongs_to :seller, class_name: "User", foreign_key: "seller_id"
  # belongs_to :buyer, class_name: "User", foreign_key: "buyer_id", optional: true

  has_many :likes, dependent: :destroy
  belongs_to :genre
  has_one :order, dependent: :destroy

  def get_image
    (image.attached?)? image: "no-image-icon.jpg"
  end

  def liked_by?(user)
    likes.exists?(user_id: user.id)
  end

  def self.search(search, keyword)
    if search != ""
      @post = Post.where(["name LIKE(?)", "%#{keyword}%"])
    else
      @post = Post.all
    end
  end

end
