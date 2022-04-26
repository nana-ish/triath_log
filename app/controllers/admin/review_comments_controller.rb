class Admin::ReviewCommentsController < ApplicationController

  before_action :autheniticate_admin, {only: [:destroy]}

  def destroy
    review_comment = ReviewComment.find_by(id: params[:id],review_id: params[:review_id])
    review_comment.destroy
    if review_comment.destroy
      redirect_to request.referer, notice: "レビューが削除されました。"
    else
      redirect_to  request.referer, notice: "削除に失敗しました。"
    end
  end

end
