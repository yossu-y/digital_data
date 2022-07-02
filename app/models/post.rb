class Post < ApplicationRecord
  has_one_attached :image

  default_scope -> { order(updated_at: :desc) }

  belongs_to :user
  has_many :likes, dependent: :destroy
  belongs_to :genre

  def get_image
    (image.attached?)? image: "no-image-icon.jpg"
  end

end
