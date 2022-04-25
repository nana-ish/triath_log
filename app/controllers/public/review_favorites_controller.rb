class Public::ReviewFavoritesController < ApplicationController

   before_action :autheniticate_end_user, {only: [:create,:destroy,:index]}

  def create
    @review_favorite = ReviewFavorite.new(end_user_id: current_end_user.id, review_id: params[:review_id])
    @review_favorite.save
  end

  def destroy
    @review_favorite = ReviewFavorite.find_by(end_user_id: current_end_user.id, review_id: params[:review_id])
    @review_favorite.destroy
  end

  def index
    @end_user = EndUser.find(params[:end_user_id])
    @review_favorites =@end_user.review_favorites

  end

end
