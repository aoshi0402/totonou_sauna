class User::SaunasController < ApplicationController
  def new
    @sauna = Sauna.new
  end

  def create
    @sauna = Sauna.new(sauna_params)
    @sauna.user_id = current_user.id
    if @sauna.save
      redirect_to user_sauna_path(@sauna), notice: "サウナの新規登録がされました"
    else
      @saunas = Sauna.all
      render 'index'
    end
  end

  def show
    @sauna = Sauna.find(params[:id])
  end

  def edit
    @sauna = Sauna.find(params[:id])
    if current_user.id == @sauna.user_id
    else
      redirect_to user_path
    end
  end

  def update
    @sauna = Sauna.find(params[:id])
    if @sauna.update(sauna_params)
      redirect_to user_sauna_path(@sauna), notice: "編集内容を更新しました"
    else
      render "edit"
    end
  end

  def destroy
    @sauna = Sauna.find(params[:id])
    @sauna.destoy
    redirect_to root_path
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
