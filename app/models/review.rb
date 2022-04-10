class Review < ApplicationRecord
   
  #ER図参照
  has_many:review_favorites, dependent: :destroy
  has_many:comments, dependent: :destroy
  belongs_to:end_user
  belongs_to:rece

end
