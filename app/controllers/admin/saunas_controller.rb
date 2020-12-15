class Admin::SaunasController < ApplicationController
  before_action :authenticate_admin!

  def index
    @saunas = Sauna.all
  end

  def destroy
    @sauna = Sauna.find(params[:id])
    @sauna.destroy
    redirect_to request.referer
  end
end
