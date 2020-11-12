class HomesController < ApplicationController
  def top
    @saunas = Sauna.all
    @saunas_ikitai = Sauna.ikitai_ranking
    @saunas_pv = Sauna.pv_ranking
    @saunas_food = Sauna.food_ranking
    gon.saunas = Sauna.all
  end

  def about
  end

  def login_select
  end
end
