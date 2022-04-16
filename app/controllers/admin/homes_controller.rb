class Admin::HomesController < ApplicationController
  def top
    @races = Race.all
  end
end
