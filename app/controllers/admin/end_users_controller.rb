class Admin::EndUsersController < ApplicationController
  def show
    @end_user = EndUser.find(params[:id])
    @reviews = @end_user.reviews
  end

  def index
    @end_users = EndUser.all
  end

  def edit
  end

  def update
  end
end
