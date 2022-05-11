class Public::ReviewsController < ApplicationController

  before_action :autheniticate_end_user, {only: [:new,:show,:create,:edit,:update,:destroy]}

  def new
    @review = Review.new
    @end_user = current_end_user
  end


  def index
    @end_user =current_end_user
    @districts = District.all
    @district = District.new
    if params[:district_id]
       @district = District.find(params[:district_id])
       @races = @district.races.left_joins(:reviews).group(:id).order("AVG(reviews.score) desc")
    else
      @races = Race.left_joins(:reviews).group(:id).order("AVG(reviews.score) desc")
    end
  end

  def show
    @race = Race.find(params[:id])
    @reviews = @race.reviews.order(created_at: :desc).page(params[:page]).per(3)
    @ave_score = @race.reviews.average(:score)
    @ave_level = @race.reviews.average(:level)
    @ave_course = @race.reviews.average(:course)
    @ave_water = @race.reviews.average(:water)
    @ave_sightseeing = @race.reviews.average(:sightseeing)
  end

  def edit
    @review = Review.find(params[:id])
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to review_path(@review.race), notice: "レビューが投稿されました。"
    else
      @end_user = current_end_user
      render :new, notice: "再度投稿をお願いします。"
    end
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy
    if review.destroy
      redirect_to review_path(review.race), notice: "レビューが削除されました。"
    else
      render :show, notice: "削除に失敗しました。"
    end
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to review_path(@review.race), notice: "レビューが投稿されました。"
    else
      render :edit,notice: "再度投稿をお願いします。"
    end
  end

  private

  def review_params
    params.require(:review).permit(:end_user_id,:race_id,:score,:level,:course,:water,:sightseeing,:title,:comment,:review_image)
  end

end
