require "rails_helper"

RSpec.describe "Userモデルのリクエストテスト", type: :request do
  let(:user) { create(:user) }


  describe "ログインページテスト" do
    it "正しく表示されること" do
      get new_user_session_path
      expect(response).to have_http_status(200)
    end
  end

  describe "ログイン" do
    let (:registered_user) { create(:user) }
    let (:unregistered_user) { build(:user) }
    let (:req_params) { { user: { email: user.email, password: user.password } } }

    context "登録済ユーザでログインすると" do
      let (:user) { registered_user }

      it "成功すること" do
        post user_session_path, params: req_params
        expect(response).to have_http_status(302)
      end
      it "ログイン後トップページに遷移されること" do
        post user_session_path, params: req_params
        expect(response).to redirect_to root_path
      end
    end

    context "存在しないユーザでログインすると" do
      let (:user) { unregistered_user  }

      it "失敗すること" do
        post user_session_path, params: req_params
        expect(response).to have_http_status(200)
      end
      it "エラーメッセージが表示されること" do
        post user_session_path, params: req_params
        expect(response.body).to include "メールアドレスまたはパスワードが違います。"
      end
    end
  end

  describe "新規登録ページテスト" do
    it "正しく表示されること" do
      get new_user_registration_path
      expect(response).to have_http_status(200)
    end
  end

  describe "新規登録テスト" do
    let (:req_params) { { user: { name: "foge", email: "gfoge@foge", password: "password", password_confirmation: "password" } } }

    context "正しい" do
      it "登録に成功すること" do
        post user_registration_path, params: req_params
        expect(response).to have_http_status(302)
      end
      it "トップページに遷移されること" do
        post user_registration_path, params: req_params
        expect(response).to redirect_to root_path
      end
    end
  end

  #########################userページ###################################################

  describe "ユーザー詳細ページ表示" do
    context "未ログインの場合" do
      it "ログインページへリダイレクトすること" do
        get user_user_path user.id
        expect(response).to redirect_to new_user_session_path
      end
    end

    context "ログインしている場合" do
      it "リクエストが成功すること" do
        sign_in(user)
        get user_user_path(user.id)
        expect(response).to have_http_status "200"
      end
    end

    context "ログインしている場合" do
      it "自分以外のユーザーのリクエストが成功すること" do
        sign_in(user)
        another_user = create(:user)
        get user_user_path(another_user.id)
        expect(response).to have_http_status "200"
      end

      it "退会できること" do
        sign_in(user)
        delete destroy_user_session_path(user.id)
        expect(response).to have_http_status "204"
      end
    end
  end

  describe "パスワード変更ページ表示" do
    context "未ログインの場合" do
      it "ログインページへリダイレクトすること" do
        get edit_user_registration_path
        expect(response).to redirect_to new_user_session_path
      end
    end

    context "ログインしている場合" do
      it "リクエストが成功すること" do
        sign_in(user)
        get edit_user_registration_path
        expect(response).to have_http_status "200"
      end
      
      it "パスワード変更ができること" do
        sign_in(user)
        patch user_registration_path
        expect(response).to have_http_status "200"
      end
    end
  end

    
  describe "ユーザー編集ページ表示" do
    context "未ログインの場合" do
      it "ログインページへリダイレクトすること" do
        get edit_user_user_path user.id
        expect(response).to redirect_to new_user_session_path
      end
    end

    context "ログインしている場合" do
      it "リクエストが成功すること" do
        sign_in(user)
        get edit_user_user_path(user.id)
        expect(response).to have_http_status "200"
      end
    end
  end
  describe "ユーザーの編集を更新" do
    let(:user_params) { { name: "改名" } }

    context "未ログインの場合" do
      it "ログインページへリダイレクトすること" do
        put user_user_path user.id, user: user_params
        expect(response).to redirect_to new_user_session_path
      end
    end

    context "ログインしている場合" do
      before do
        sign_in user
      end

      it "リクエストが成功すること" do
        put user_user_path user.id, user: user_params
        expect(response.status).to eq 302
      end
      it "更新が成功すること" do
        put user_user_path user.id, user: user_params
        expect(user.reload.name).to eq "改名"
      end
      it "ユーザーページへリダイレクトすること" do
        put user_user_path user.id, user: user_params
        expect(response).to redirect_to user_user_path user.id
      end
    end
  end
end
