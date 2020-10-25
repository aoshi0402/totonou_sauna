class HomesController < ApplicationController
  def top
    @saunas = Sauna.all
  end

  def about
  end
end
