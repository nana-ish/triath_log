class Admin::ReviewsController < ApplicationController

  def index
    @end_user =current_end_user
    @districts = District.all
    if params[:district_id]
       @district = District.find(params[:district_id])
       @races = @district.races.page(params[:page]).per(3)
    else
      @races = Race.left_joins(:reviews).group(:id).order("AVG(reviews.score) desc").page(params[:page]).per(3)
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

 def destroy
    review = Review.find(params[:id])
    review.destroy
    if review.destroy
      redirect_to admin_review_path(review.race), notice: "レビューが削除されました。"
    else
      render :show,notice: "削除に失敗しました。"
    end
  end

end
