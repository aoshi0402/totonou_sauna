class HomesController < ApplicationController
  def top
    @saunas = Sauna.all
    @saunas_ikitai = Sauna.ikitai_ranking
    @saunas_pv = Sauna.pv_ranking
    gon.saunas = Sauna.all
  end

  def about
  end
end
