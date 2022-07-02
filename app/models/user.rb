class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :profile_image

  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy



  def get_profile_image
    (profile_image.attached?)? profile_image: "no-image-icon.jpg"
  end

end
