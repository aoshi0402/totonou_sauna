require 'rails_helper'

RSpec.describe "Userモデルのリクエストテスト", type: :request do
  let(:user) { create(:user) }

  describe "ユーザー詳細ページ表示" do
    context "未ログインの場合" do
      it "ログインページへリダイレクトすること" do
        get user_user_path user.id
        expect(response).to redirect_to new_user_session_path
      end
    end

    context "ログインしている場合" do
      it "リクエストが成功すること" do
        login(user)
        get user_user_path
        expect(response).to have_http_status "200"
      end
    end
  end
end

