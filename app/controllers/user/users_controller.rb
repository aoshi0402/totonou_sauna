class User::UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :destroy]

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_user_path(@user), notice: "会員情報の更新完了しました"
    else
      render "edit"
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.is_deleted = true
    @user.save
    reset_session
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(
      :name,
      :sex,
      :email,
      :postcode,
      :prefecture,
      :address_city,
      :address_street,
      :address_building,
      :introduction,
      :image_id,
    )
  end
end
