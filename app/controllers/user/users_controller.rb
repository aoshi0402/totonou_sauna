class User::UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :destroy]

  def show
    @user = User.find(params[:id])
      # Entryモデルからログインユーザーのレコードを抽出
      @current_entry = Entry.where(user_id: current_user.id)
      # Entryモデルからメッセージ相手のレコードを抽出
      @another_entry = Entry.where(user_id: @user.id)
      unless @user.id == current_user.id
        @current_entry.each do |current|
          @another_entry.each do |another|
            # ルームが存在する場合
            if current.room_id == another.room_id
              @is_room = true
              @room_id = current.room_id
            end
          end
        end
        # ルームが存在しない場合は新規作成
        unless @is_room
          @room = Room.new
          @entry = Entry.new
        end
      end
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
      :prefecture_code,
      :address_city,
      :address_street,
      :address_building,
      :introduction,
      :image,
    )
  end
end
