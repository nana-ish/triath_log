class Public::ReviewsController < ApplicationController
  def new
  end

  def index
    @districts = District.all 
    @races = Race.all
    
  end

  def show
  end

  def edit
  end

  def create
  end

  def destroy
  end

  def update
  end
end
