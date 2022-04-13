class Admin::EndUsersController < ApplicationController
  def show
  end

  def index
    @end_users = EndUser.all
  end

  def edit
  end

  def update
  end
end
