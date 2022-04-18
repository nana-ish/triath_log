class Public::ReviewsController < ApplicationController

  def new
    @review = Review.new
    @end_user = current_end_user
  end


  def index
    @end_user =current_end_user
    @districts = District.all
    if params[:district_id]
       @district = District.find(params[:district_id])
       @races = @district.races
    else
     #@races = Race.find(Review.group(:race_id).order("AVG(score) desc").pluck(:race_id))
     @races = Race.left_joins(:reviews).group(:id).order("AVG(reviews.score) desc")
    end
  end

  def show
    @race = Race.find(params[:id])
    @reviews = @race.reviews
    @ave_score = @race.reviews.average(:score)
    @ave_level = @race.reviews.average(:level)
    @ave_course = @race.reviews.average(:course)
    @ave_water = @race.reviews.average(:water)
    @ave_sightseeing = @race.reviews.average(:sightseeing)
    # @review_comments = ReviewComment.all
  end

  def edit
  end

  def create
    review = Review.new(review_params)
    review.save
    if review.save
      redirect_to review_path(review.race), notice: "レビューが投稿されました。"
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
    params.require(:review).permit(:end_user_id,:race_id,:score,:level,:course,:water,:sightseeing,:title,:comment,:review_image)
  end

end
