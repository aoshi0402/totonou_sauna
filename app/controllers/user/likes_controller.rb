class User::LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @review = Review.find(params[:review_id])
    like = current_user.likes.new(review_id: @review.id)
    like.save
  end

  def destroy
    @review = Review.find(params[:review_id])
    like = current_user.likes.find_by(review_id: @review.id)
    like.destroy
  end
end
