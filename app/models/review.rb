class Review < ApplicationRecord

  #ER図参照
  has_many:review_favorites, dependent: :destroy
  has_many:comments, dependent: :destroy
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

end
