class Public::ReviewsController < ApplicationController

  def new
    @review = Review.new
    @end_user = current_end_user
  end

  def index
    @districts = District.all
    @races = Race.all
  end

  def show
    @race = Race.find_by(params[:race_id])
    @reviews = @race.reviews
    @ave_score = @race.reviews.average(:score)
    @ave_revel = @race.reviews.average(:revel)
    @ave_course = @race.reviews.average(:course)
    @ave_water = @race.reviews.average(:water)
    @ave_sightseeing = @race.reviews.average(:sightseeing)
  end

  def edit
  end

  def create
    review = Review.new(review_params)
    review.save
    if review.save
      redirect_to review_path(review), notice: "レビューが投稿されました。"
    else
      render :new,notice: "再度投稿をお願いします。"
    end
  end

  def destroy
  end

  def update
  end

  private

  def review_params
    params.require(:review).permit(:end_user_id,:race_id,:score,:revel,:course,:water,:sightseeing,:title,:comment,:review_image)
  end

end
