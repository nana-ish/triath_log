class Public::HomesController < ApplicationController

  def top
    @races = Race.all.order(date: "asc")
    @end_user = current_end_user
  end

  def about
  end
end
