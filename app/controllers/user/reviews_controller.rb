class User::ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def new
    @review = Review.new
  end

  def create
    sauna = Sauna.find(params[:sauna_id])
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.sauna_id = sauna.id
    if @review.save
      flash[:notice] = "レビューが投稿されました"
      redirect_to user_sauna_review_path(@review.sauna, @review)
    else
      flash.now[:alart_flash] = "レビューの投稿に失敗しました"
      render "new"
    end
  end

  def index
    @sauna = Sauna.find(params[:sauna_id])
    @reviews = @sauna.reviews.page(params[:page]).per(5)
  end

  def show
    @review = Review.find(params[:id])
    @comment = Comment.new
    @comments = @review.comments.page(params[:page]).per(10)
  end

  def edit
    @review = Review.find(params[:id])
    unless @review.user == current_user
    redirect_to root_path
    end
  end

  def update
    @review = Review.find(params[:id])

    if @review.update(review_params)
    flash[:notice] = "レビューが更新されました"
    redirect_to user_sauna_review_path(@review.sauna, @review)
    else
      flash.now[:alart_flash] = "レビューの更新に失敗しました"
      render "edit"
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    flash[:notice] = "レビューの削除に成功しました"
    redirect_to user_sauna_reviews_path(@review.sauna, @review)
  end

  private

    def review_params
      params.require(:review).permit(:sauna_id, :title, :body, :score)
    end
end
