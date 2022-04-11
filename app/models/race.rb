class Race < ApplicationRecord

  #ER図参照
  has_many:race_favorites, dependent: :destroy
  has_many:reviews, dependent: :destroy
  belongs_to:district

  has_one_attached :race_image

  def get_race_image(width, height)
    unless race_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      race_image.attach(io: File.open(file_path), filename: 'default-image.jpg',content_type:'image/jpeg')
    end
      race_image.variant(resize_to_fit:[width, height]).processed
  end

  def get_race_situation(race)
    now = Time.new
    race_date = race.date
    deadline = race.deadline
    if (now < deadline)
      return "0"
    elsif (now > deadline) && (now < race_date)
      return "1"
    elsif (now > race_date)
      return "2"
    end
  end


end
