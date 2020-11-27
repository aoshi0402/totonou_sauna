class User::SaunasController < ApplicationController
  before_action :authenticate_user!

  def new
    @sauna = Sauna.new
  end

  def create
    @sauna = Sauna.new(sauna_params)
    @sauna.user_id = current_user.id
    if @sauna.save
      flash[:notice] = "サウナの新規登録がされました"
      redirect_to user_sauna_path(@sauna)
    else
      flash.now[:alart_flash] = "サウナの新規登録に失敗しました"
      render 'new'
    end
  end

  def show
    @sauna = Sauna.find(params[:id])
    impressionist(@sauna, nil, unique: [:impressionable_id, :ip_address])
  end

  def edit
    @sauna = Sauna.find(params[:id])
    if current_user.id == @sauna.user_id
    else
      redirect_to user_sauna_path
    end
  end

  def update
    @sauna = Sauna.find(params[:id])
    if @sauna.update(sauna_params)
      flash[:notice] = "編集内容を更新しました"
      redirect_to user_sauna_path(@sauna)
    else
      flash.now[:alart_flash] = "更新に失敗しました"
      render "edit"
    end
  end

  def destroy
    @sauna = Sauna.find(params[:id])
    @sauna.destroy
    flash[:notice] = "サウナを削除しました"
    redirect_to root_path
  end

  def map
    @sauna = Sauna.find(params[:sauna_id])
    gon.latitude = @sauna.latitude
    gon.longitude = @sauna.longitude
  end

  def keyword_search
    @saunas = Sauna.keyword_search(params[:keyword_search])
    @keyword_search = params[:keyword_search]
  end

  def prefecture_search
    @saunas = Sauna.prefecture_search(params[:prefecture_search])
    @prefecture_search = params[:prefecture_search]
    @prefecture = JpPrefecture::Prefecture.find(code: @prefecture_search)
  end

  def genre_search
    @saunas = Sauna.genre_search(params[:genre_search])
    @genre_search = params[:genre_search]
    @genre = Genre.find_by(id: @genre_search)
  end

  # イキタイ一覧
  def ikitais
    user_ikitai = current_user.ikitais.pluck(:sauna_id)
    @user_ikitai_saunas = Sauna.where(id: user_ikitai)
    if Rails.env.production?
      @saunas_image_url = "https://refile-totonousauna.s3-ap-northeast-1.amazonaws.com/store/?????-thumbnail."
    end
  end

  def sauna_params
    params.require(:sauna).permit(
      :name,
      :postcode,
      :prefecture_code,
      :address_city,
      :address_street,
      :address_building,
      :introduction,
      :access,
      :tel,
      :business_hour,
      :home_page,
      :water_temperature,
      :sauna_temperature,
      :image,
      genre_ids: []
    )
  end
end
