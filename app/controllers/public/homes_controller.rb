class Public::HomesController < ApplicationController
  def top
    @races = Race.all
  end

  def about
  end
end
