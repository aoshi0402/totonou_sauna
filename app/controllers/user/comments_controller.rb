class User::CommentsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.review_id = params[:review_id]
    if @comment.save
      flash[:success] = "コメントが送信されました"
      redirect_to user_sauna_review_path(params[:sauna_id], params[:review_id])
    else
      render "/user/reviews/show"
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    unless @comment.user == current_user
      redirect_to root_path
    end
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
    redirect_to user_sauna_review_path(@comment.review.sauna, @comment.review)
    else
    render "edit"
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @review = @comment.review
    @comment.destroy
    redirect_to user_sauna_review_path(@comment.review.sauna, @comment.review)
  end

  private

    def comment_params
      params.require(:comment).permit(:review_id, :title, :body)
    end
end
