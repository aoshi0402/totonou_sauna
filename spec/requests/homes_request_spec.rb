require "rails_helper"

RSpec.describe "Homes", type: :request do
  describe "トップページ(ルート)" do
    context "ページが正しく表示される" do
      before do
        get root_path
      end

      it "200リクエストが返ってくる" do
        expect(response.status).to eq 200
      end
    end
  end

  describe "サイト概要ページ(GET #about)" do
    context "ページが正しく表示される" do
      before do
        get about_path
      end

      it "200リクエストが返ってくる" do
        expect(response.status).to eq 200
      end
    end
  end
end
