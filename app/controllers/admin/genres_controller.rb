class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!

  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to admin_genres_path(@genre)
      flash[:notice] = "ジャンルの新規登録がされました"
    else
      @genres = Genre.all
      flash.now[:alart_flash] = "ジャンルの登録に失敗しました"
      render 'index'
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      flash[:notice] = "ジャンルの更新がされました"
      redirect_to admin_genres_path
    else
    flash.now[:alart_flash] = "ジャンルの更新に失敗しました"
    render 'edit'
    end
  end

  private

    def genre_params
      params.require(:genre).permit(:name, :image)
    end
end
