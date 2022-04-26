class Public::SearchesController < ApplicationController


 def index
    @range = params[:range]
    if @range == "大会名"
        @races = Race.looks(params[:search], params[:word])
    elsif @range == "User名"
        @end_users = EndUser.looks(params[:search], params[:word])
    end
 end

end
