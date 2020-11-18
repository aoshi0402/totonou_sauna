require "rails_helper"

RSpec.describe "Saunaモデル", type: :model do
  describe "バリデーションテスト" do
    let(:user) { create(:user) }
    let(:sauna) { create(:sauna, user: user) }
    subject { sauna.valid? }
    it "サウナの新規登録ができること" do
      is_expected.to eq true
    end
  end
end