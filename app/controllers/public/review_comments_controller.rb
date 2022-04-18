class Public::ReviewCommentsController < ApplicationController

  def create
    review_comment = ReviewComment.new(comment_params)
    review_comment.save
    redirect_to request.referer
  end

  private

  def comment_params
    params.require(:review_comment).permit(:text,:end_user_id,:review_id)
  end

end
