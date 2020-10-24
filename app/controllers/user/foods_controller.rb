class User::FoodsController < ApplicationController
def new
    @food = Food.new
  end

  def create
    sauna = Sauna.find(params[:sauna_id])
    @food = Food.new(food_params)
    @food.user_id = current_user.id
    @food.sauna_id = sauna.id
    if @food.save
      redirect_to user_sauna_food_path(@food.sauna, @food)
    else
      render 'new'
    end
  end

  def index
    @sauna = Sauna.find(params[:sauna_id])
    @foods = @sauna.foods
  end

  def show
    @food = Food.find(params[:id])
  end

  def edit
    @food = Food.find(params[:id])
    unless @food.user == current_user
    redirect_to root_path
    end
  end

  def update
    @food = Food.find(params[:id])
    if @food.update(food_params)
    redirect_to user_sauna_food_path(@food.sauna, @food)
    else
      render "edit"
    end
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    redirect_to user_sauna_foods_path(@food.sauna, @food)
  end

  private

    def food_params
      params.require(:food).permit(:sauna, :name, :introduction, :image, :tel, :home_page)
    end
end
