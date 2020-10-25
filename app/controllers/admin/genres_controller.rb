class Admin::GenresController < ApplicationController
	def index
		@genre = Genre.new
		@genres = Genre.all.page(params[:page]).per(1)
	end

	def create
		@genre = Genre.new(genre_params)
		if @genre.save
			redirect_to admin_genres_path(@genre)
		else
			@genres = Genre.all.page(params[:page]).per(20)
			render 'index'
		end
	end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
		@genre.update(genre_params) ? (redirect_to admin_genres_path) : (render 'edit')
  end

	private

		def genre_params
			params.require(:genre).permit(:name)
		end
end
