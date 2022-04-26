class Public::HomesController < ApplicationController
  
  def top
    @races = Race.all
    @end_user = current_end_user
  end

  def about
  end
end
