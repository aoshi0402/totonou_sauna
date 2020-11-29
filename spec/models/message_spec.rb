require "rails_helper"

RSpec.describe Message, type: :model do
  describe "バリデーション" do
    subject { message.valid? }

    let(:user) { build(:user) }
    let(:room) { build(:room) }
    let(:message) { build(:message, user: user, room: room) }

    it "メッセージが作成できること" do
      is_expected.to eq true
    end

    context "body" do
      it "空欄でないこと" do
        message.body = ""
        is_expected.to eq false
      end
    end
  end

  describe "アソシエーションのテスト" do
    let(:association) do
      described_class.reflect_on_association(target)
    end

    context "Userモデルとのアソシエーション" do
      let(:target) { :user }

      it "N:1となっている" do
        expect(association.macro).to eq :belongs_to
      end
      it "モデル名がUserになっている" do
        expect(association.class_name).to eq "User"
      end
    end

    context "Roomモデルとのアソシエーション" do
      let(:target) { :room }

      it "N:1となっている" do
        expect(association.macro).to eq :belongs_to
      end
      it "モデル名がRoomになっている" do
        expect(association.class_name).to eq "Room"
      end
    end
  end
end
