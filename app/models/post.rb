class Post < ApplicationRecord
  has_one_attached :image

  default_scope -> { order(updated_at: :desc) }

  belongs_to :user
  has_many :likes, dependent: :destroy
  belongs_to :genre
  has_one :order, dependent: :destroy

  def get_image
    (image.attached?)? image: "no-image-icon.jpg"
  end

  def liked_by?(user)
    likes.exists?(user_id: user.id)
  end

end
