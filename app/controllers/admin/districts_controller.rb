class Admin::DistrictsController < ApplicationController

  before_action :autheniticate_admin, {only: [:create,:edit,:update,:destroy]}

  def create
    @district = District.new(district_params)
    if @district.save
      redirect_to reviews_path, notice: "地域が追加されました。"
    else
      redirect_to request.referer,notice: "再度投稿をお願いします。"
    end
  end

  def edit
    @district =District.find(params[:id])
  end

  def update
    @district =District.find(params[:id])
    if @district.update(district_params)
      redirect_to reviews_path, notice: "地域が変更されました。"
    else
      redirect_to request.referer,notice: "再度投稿をお願いします。"
    end
  end

  def destroy
    @district =District.find(params[:id])
    @district.destroy
    if @district.destroy
      redirect_to reviews_path, notice: "地域が削除されました。"
    else
      redirect_to request.referer,notice: "削除に失敗しました。"
    end
  end

  private

  def district_params
    params.require(:district).permit(:name)
  end

end
