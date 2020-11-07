class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @users = User.all
    respond_to do |format|
      format.html
      format.csv do |csv|
        send_users_csv(@users)
      end
    end
  end

  def show
    @user = User.find(params[:id])
  end

  # CSVエクスポート
  def send_users_csv(users)
    csv_data = CSV.generate do |csv|
      header = %w(ID 氏名 性別 メールアドレス)
      csv << header
      users.each do |user|
        values = [user.id, user.name, user.sex, user.email]
        csv << values
      end
    end
    send_data(csv_data, filename: 'ユーザー一覧情報')
  end

  def import
    User.import(params[:file])
    redirect_to admin_users_path
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
