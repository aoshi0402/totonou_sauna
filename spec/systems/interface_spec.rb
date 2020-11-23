require "rails_helper"

RSpec.describe "表示画面のテスト", type: :feature do
  let(:admin) { create(:admin) }
  let(:user) { create(:user) }
  let(:another_user) { create(:user) }
  let(:sauna) { create(:sauna, user: user) }
  subject { page }
  before do
    visit new_user_session_path
  end

  describe "リンク表示のテスト" do
    context "管理者トップリンク" do
      it "ログインしていれば表示される" do
        visit admin_session_path
        login(admin)
        is_expected.to have_link "管理者画面トップ"
      end
    end

    context "ユーザー一覧リンク" do
      it "ログインしていれば表示される" do
        visit new_admin_session_path
        login(admin)
        is_expected.to have_link "ユーザー一覧"
      end
    end

    context "ジャンル一覧リンク" do
      it "ログインしていれば表示される" do
        visit new_admin_session_path
        login(admin)
        is_expected.to have_link "ジャンル一覧"
      end
    end

    context "ログアウトリンク" do
      it "ログインしていれば表示される" do
        visit new_admin_session_path
        login(admin)
        is_expected.to have_link "ログアウト"
      end
    end

    context "新規会員登録リンク" do
      it "ログインしていなければ表示される" do
        is_expected.to have_link "新規会員登録"
      end
      it "ログインしていれば表示されない" do
        login(user)
        is_expected.not_to have_link "新規会員登録"
      end
    end

    context "ログインリンク" do
      it "ログインしていなければ表示される" do
        is_expected.to have_link "ログイン"
      end
      it "ログインしていれば表示されない" do
        login(user)
        is_expected.not_to have_link "ログイン"
      end
    end

    context "マイページリンク" do
      it "ログインしていれば表示される" do
        login(user)
        is_expected.to have_link "マイページ"
      end
      it "ログインしていなければ表示されない" do
        is_expected.not_to have_link "マイページ"
      end
    end

    context "通知リンク" do
      it "ログインしていれば表示される" do
        login(user)
        is_expected.to have_link "通知"
      end
      it "ログインしていなければ表示されない" do
        is_expected.not_to have_link "通知"
      end
    end

    context "DMリンク" do
      it "ログインしていれば表示される" do
        login(user)
        is_expected.to have_link "メッセージ"
      end
      it "ログインしていなければ表示されない" do
        is_expected.not_to have_link "メッセージ"
      end
    end

    context "イキタイサウナリンク" do
      it "ログインしていれば表示される" do
        login(user)
        is_expected.to have_link "イキタイ！"
      end
      it "ログインしていなければ表示されない" do
        is_expected.not_to have_link "イキタイ！"
      end
    end

    context "プロフィール編集リンク" do
      it "ログインしていれば表示される" do
        login(user)
        is_expected.to have_link "プロフィール編集"
      end
      it "ログインしていなければ表示されない" do
        is_expected.not_to have_link "プロフィール編集"
      end
    end

    context "ログアウトリンク" do
      it "ログインしていれば表示される" do
        login(user)
        is_expected.to have_link "ログアウト"
      end
      it "ログインしていなければ表示されない" do
        is_expected.not_to have_link "ログアウト"
      end
    end
  end

  describe "表示テスト" do
    context "プロフィール編集ボタン" do
      it "マイページであれば表示される" do
        login(user)
        visit user_user_path(user)
        is_expected.to have_link "プロフィールを編集"
      end
      it "マイページでなければ表示されない" do
        login(another_user)
        visit user_user_path(user)
        is_expected.not_to have_link "プロフィールを編集"
      end
    end

    context "退会ボタン" do
      it "マイページであれば表示される" do
        login(user)
        visit user_user_path(user)
        is_expected.to have_link "退会"
      end
      it "マイページでなければ表示されない" do
        login(another_user)
        visit user_user_path(user)
        is_expected.not_to have_link "退会"
      end
    end

    context "パスワードを変更する" do
      it "マイページであれば表示される" do
        login(user)
        visit user_user_path(user)
        is_expected.to have_link "パスワードを変更する"
      end
      it "マイページでなければ表示されない" do
        login(another_user)
        visit user_user_path(user)
        is_expected.not_to have_link "パスワードを変更する"
      end
    end

    context "フォローボタン" do
      it "マイページであれば表示されない" do
        login(user)
        visit user_user_path(user)
        is_expected.not_to have_link "フォローする"
      end
      it "マイページでなければ表示される" do
        login(another_user)
        visit user_user_path(user)
        is_expected.to have_link "フォローする"
      end
    end

    context "メッセージボタン" do
      it "マイページであれば表示されない" do
        login(user)
        visit user_user_path(user)
        is_expected.not_to have_button "メッセージ"
      end
      it "マイページでなければ表示される" do
        login(another_user)
        visit user_user_path(user)
        is_expected.to have_button "メッセージ"
      end
    end
  end
end