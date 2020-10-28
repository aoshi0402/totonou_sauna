class User::ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    sauna = Sauna.find(params[:sauna_id])
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.sauna_id = sauna.id
    if @review.save
      redirect_to user_sauna_review_path(@review.sauna, @review)
    else
      render "new"
    end
  end

  def index
    @sauna = Sauna.find(params[:sauna_id])
    @reviews = @sauna.reviews
  end

  def show
    @review = Review.find(params[:id])
    @comment = Comment.new
    @comments = @review.comments
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
    redirect_to user_sauna_review_path(@review.sauna, @review)
    else
      render "edit"
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to user_sauna_reviews_path(@review.sauna, @review)
  end

  private

    def review_params
      params.require(:review).permit(:sauna_id, :title, :body, :score)
    end
end
