class Admin::HomesController < ApplicationController

  before_action :autheniticate_admin, {only: [:top]}

  def top
    @races = Race.all.page(params[:page]).per(10)
  end
end
