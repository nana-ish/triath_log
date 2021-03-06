class Admin::RacesController < ApplicationController

  before_action :autheniticate_admin, {only: [:new,:show,:create,:edit,:update]}

  def new
    @race = Race.new
  end

  def show
    @race = Race.find(params[:id])
  end

  def index
  end

  def create
    @race = Race.new(race_params)
    if @race.save
      redirect_to admin_race_path(@race), notice: "新しいレースが投稿されました。"
    else
      render :new,notice: "入力事項が不足しています。"
    end
  end

  def edit
    @race = Race.find(params[:id])
  end

  def update
    @race = Race.find(params[:id])
    if @race.update(race_params)
      redirect_to admin_race_path(@race), notice: "レース情報が編集されました"
    else
      render "edit" ,notice: "編集に失敗しました"
    end
  end

  def destroy
    race = Race.find(params[:id])
    race.destroy
    if race.destroy
      redirect_to request.referer, notice: "削除されました。"
    else
      redirect_to  request.referer ,notice: "削除に失敗しました。"
    end
  end

  private

  def race_params
    params.require(:race).permit(:district_id,:name,:date,:cost,:deadline,:link,:categorie,:venue,:introduction,:is_active,:race_image)
  end

end
