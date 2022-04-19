class Review < ApplicationRecord

  #ER図参照
  has_many:review_favorites, dependent: :destroy
  has_many:review_comments, dependent: :destroy
  belongs_to:end_user
  belongs_to:race

  has_one_attached :review_image

  def get_review_image(width, height)
    unless review_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      review_image.attach(io: File.open(file_path), filename: 'default-image.jpg',content_type:'image/jpeg')
    end
      review_image.variant(resize_to_fit:[width, height]).processed
  end

  def favorited?(end_user)
    review_favorites.where(end_user_id: user.id).exists?
  end

   # 検索機能
  def self.looks(search, word)
    if search == "perfect_match"
      @review = Review.where("name LIKE?", "#{word}")
    elsif search == "partial_match"
      @review = Review.where("name LIKE?","%#{word}%")
    else
      @review = Review.all
    end
  end

end
