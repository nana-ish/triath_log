class Public::ReviewCommentsController < ApplicationController

  def create
    review_comment = ReviewComment.new(comment_params)
    if review_comment.save
       @review = Review.find(comment_params[:review_id])
    else
      redirect_to request.referer,notice: "1文字以上の入力をお願いします。"
    end
  end

  def destroy
    review_comment = ReviewComment.find_by(id: params[:id],review_id: params[:review_id])
    review_comment.destroy
    @review = Review.find(params[:review_id])
  end

  private

  def comment_params
    params.require(:review_comment).permit(:text,:end_user_id,:review_id)
  end

end
