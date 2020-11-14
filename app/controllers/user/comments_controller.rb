class User::CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @review = @comment.review
    if @comment.save
      flash[:notice] = "コメントが送信されました"
      redirect_to user_sauna_review_path(@review.sauna, @review)
    else
      flash.now[:alart_flash] = "コメントの投稿に失敗しました"
      @comments = @review.comments
      render '/user/reviews/show'
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
    flash[:notice] = "コメントが更新されました"
    redirect_to user_sauna_review_path(@comment.review.sauna, @comment.review)
    else
    flash.now[:alart_flash] = "コメントの更新に失敗しました"
    render "edit"
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @review = @comment.review
    @comment.destroy
    flash[:notice] = "コメントの削除に成功しました"
    redirect_to user_sauna_review_path(@comment.review.sauna, @comment.review)
  end

  private

    def comment_params
      params.require(:comment).permit(:review_id, :title, :body)
    end
end
