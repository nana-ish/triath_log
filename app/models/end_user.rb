class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # ER図参照
  has_many :reviews, dependent: :destroy
  has_many:race_favorites,dependent: :destroy
  has_many:comments, dependent: :destroy
  has_many:review_favorites, dependent: :destroy

  has_one_attached :end_user_image

  def get_end_user_image(width, height)
    unless end_user_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      end_user_image.attach(io: File.open(file_path), filename: 'default-image.jpg',content_type:'image/jpeg')
    end
      end_user_image.variant(resize_to_fit:[width, height]).processed
  end

  def race_favorited?(race)
    race_favorites.where(race_id: race).exists?
  end

  def review_favorited?(review)
    review_favorites.where(review_id: review).exists?
  end

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |end_user|
    end_user.password = SecureRandom.urlsafe_base64
    end_user.name="ゲスト"
    end
  end

end
