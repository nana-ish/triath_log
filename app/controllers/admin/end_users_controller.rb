class Admin::EndUsersController < ApplicationController

  before_action :autheniticate_admin, {only: [:show,:index,:edit,:update,:destroy]}

  def show
    @end_user = EndUser.find(params[:id])
    @reviews = @end_user.reviews
  end

  def index
    @end_users = EndUser.all
  end

  def edit
    @end_user = EndUser.find(params[:id])
  end

  def update
    @end_user = EndUser.find(params[:id])
    redirect_to admin_end_users_path, notice: 'ゲストは変更・削除できません' if @end_user.email == 'guest@example.com'
    if @end_user.update(end_user_params)
      redirect_to admin_end_users_path, notice: '会員情報が正常に更新されました。'
    else
      redirect_to edit_admin_end_user_path(@end_user), notice: '会員情報の更新に失敗しました。'
    end
  end

  def destroy
    @end_user = EndUser.find(params[:id])
    redirect_to admin_end_users_path, notice: 'ゲストは変更・削除できません' if @end_user.email == 'guest@example.com'
    @end_user.destroy
    redirect_to  admin_end_users_path, notice: '正常に削除されました。'
  end

  private

  def end_user_params
    params.require(:end_user).permit(:name,:email,:end_user_image,:is_deleted)
  end


end
