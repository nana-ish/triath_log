class ReviewFavorite < ApplicationRecord

  #ER図参照
  belongs_to:review
  belongs_to:end_user


end
