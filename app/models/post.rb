class Post < ApplicationRecord
  has_one_attached :image

  belongs_to :user
  has_many :likes, dependent: :destroy
  belongs_to :genre

end
