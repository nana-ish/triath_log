class Public::RaceFavoritesController < ApplicationController

  def index
    @end_user = EndUser.find(params[:end_user_id])
    @race_favorites = @end_user.race_favorites
  end

  def create
    @race_favorite = RaceFavorite.new(end_user_id: current_end_user.id, race_id: params[:race_id])
    @race_favorite.save
    redirect_to reviews_path
  end

  def destroy
    @race_favorite = RaceFavorite.find_by(end_user_id: current_end_user.id, race_id: params[:race_id])
    @race_favorite.destroy
    redirect_to reviews_path
  end


end
