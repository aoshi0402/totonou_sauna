require "rails_helper"

RSpec.describe "新規登録、ログインのテスト", type: :feature do
  subject { page }

  let(:admin) { create(:admin) }
  let(:user) { create(:user) }

  describe "ユーザー認証のテスト" do
    context "新規会員登録のテスト" do
      it "新規会員登録できること" do
        visit new_user_registration_path
        fill_in "氏名", with: Faker::Name.name
        fill_in "メールアドレス", with: Faker::Internet.email
        fill_in "パスワード", with: "password"
        fill_in "パスワード(再確認)", with: "password"
        click_button "新規会員登録"
        is_expected.to have_content "ログアウト"
      end

      it "新規会員登録できないこと" do
        visit new_user_registration_path
        fill_in "氏名", with: Faker::Name.name
        fill_in "メールアドレス", with: Faker::Internet.email
        fill_in "パスワード", with: "bbbbbbbb"
        fill_in "パスワード(再確認)", with: "aaaaaaaa"
        click_button "新規会員登録"
        is_expected.to have_content "新規会員登録"
      end
    end

    context "ユーザーログインのテスト" do
      it "ログインできること" do
        visit new_user_session_path
        login(user)
        is_expected.to have_content "ログアウト"
      end

      it "ログインできないこと" do
        visit new_user_session_path
        fill_in "メールアドレス", with: user.email
        fill_in "パスワード", with: "aaaaaaaa"
        click_button "ログイン"
        is_expected.to have_content "ログイン"
      end
    end

    context "ユーザーログアウトのテスト" do
      it "ログアウトできること" do
        visit new_user_session_path
        login(user)
        click_link "ログアウト"
        is_expected.to have_content "ログイン"
      end
    end
  end

  describe "管理者認証のテスト" do
    context "管理者ログインのテスト" do
      it "ログインできること" do
        visit new_admin_session_path
        login(admin)
        is_expected.to have_content "ログアウト"
      end

      it "ログインできないこと" do
        visit new_admin_session_path
        fill_in "メールアドレス", with: Faker::Internet.email
        fill_in "パスワード", with: "222222222"
        click_button "ログイン"
        is_expected.to have_content "ログイン"
      end
    end
  end
end
