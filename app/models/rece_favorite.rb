class ReceFavorite < ApplicationRecord

  #ER図参照
  belongs_to:rece
  belongs_to:end_user

  def get_review_image(width, height)
    unless review_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpeg')
      review_image.attach(io: File.open(file_path), filename: 'default-image.jpg',content_type:'image/jpeg')
    end
      review_image.variant(resize_to_fit:[width, height]).processed
  end

end
