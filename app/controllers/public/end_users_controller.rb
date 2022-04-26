class Public::EndUsersController < ApplicationController

   before_action :autheniticate_end_user, {only: [:show,:edit,:update,:destroy]}

  def show
    @end_user = EndUser.find(params[:id])
    @reviews = @end_user.reviews
  end

  def edit
    @end_user = EndUser.find(params[:id])

    if @end_user.email == 'guest@example.com'
      redirect_to admin_end_users_path, notice: 'ゲストは変更・削除できません'
      return
    end

  end

  def index
  end

  def update
    @end_user = EndUser.find(params[:id])

    if @end_user.email == 'guest@example.com'
      redirect_to admin_end_users_path, notice: 'ゲストは変更・削除できません'
      return
    end

    if @end_user.update(end_user_params)
      redirect_to root_path, notice: '会員情報が正常に更新されました。'
    else
      render "edit"
    end
  end

  def destroy
    @end_user = EndUser.find(params[:id])

    if @end_user.email == 'guest@example.com'
      redirect_to admin_end_users_path, notice: 'ゲストは変更・削除できません'
      return
    end

    @end_user.destroy
    redirect_to  root_path, notice: '正常に削除されました。'
  end

  private

  def end_user_params
    params.require(:end_user).permit(:name,:email,:end_user_image)
  end


end
