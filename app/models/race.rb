class Race < ApplicationRecord

  #ER図参照
  has_many :race_favorites, dependent: :destroy
  has_many :reviews, dependent: :destroy
  belongs_to :district
  #belongs_to :end_user

  validates :district_id, presence: true
  validates :name, presence: true
  validates :date, presence: true
  validates :cost, presence: true
  validates :deadline, presence: true
  validates :link, presence: true
  validates :categorie, presence: true
  validates :venue, presence: true
  validates :introduction, presence: true

  has_one_attached :race_image

  validate :race_image_type, :race_image_size

  def race_image_type
    if (race_image.attached?) && (!race_image.blob.content_type.in?(%('image/jpeg image/png')))
      errors.add(:race_image, 'はjpegまたはpng形式でアップロードしてください')
    end
  end

  def race_image_size
    if (race_image.attached?) && (race_image.blob.byte_size > 3.megabytes)
      errors.add(:race_image, "は1つのファイル3MB以内にしてください")
    end
  end

  def get_race_image(width, height)
    unless race_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      race_image.attach(io: File.open(file_path), filename: 'default-image.jpg',content_type: 'image/jpeg')
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
    else
      return "3"
    end
  end

 # 検索機能
  def self.looks(search, word)
    if search == "perfect_match"
      @race = Race.where("name LIKE?", "#{word}")
    elsif search == "partial_match"
      @race = Race.where("name LIKE?","%#{word}%")
    else
      @race = Race.all
    end
  end

end
