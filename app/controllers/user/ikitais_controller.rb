class User::IkitaisController < ApplicationController
  before_action :authenticate_user!

  def create
    @sauna = Sauna.find(params[:sauna_id])
    ikitai = current_user.ikitais.new(sauna_id: @sauna.id)
    ikitai.save
  end

  def destroy
    @sauna = Sauna.find(params[:sauna_id])
    ikitai = current_user.ikitais.find_by(sauna_id: @sauna.id)
    ikitai.destroy
  end
end
