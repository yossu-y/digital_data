class Order < ApplicationRecord
  has_one_attached :image

  belongs_to :user
  belongs_to :post

  def get_image
    (image.attached?)? image: "no-image-icon.jpg"
  end

end
