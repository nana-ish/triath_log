class ReviewComment < ApplicationRecord
   #ER図参照
  belongs_to:end_user
  belongs_to:review

  validates :text, presence: true

end
