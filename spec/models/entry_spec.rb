require "rails_helper"

RSpec.describe Entry, type: :model do
	describe "アソシエーションテスト" do
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
      it "モデル名がUserになっている" do
        expect(association.class_name).to eq "Room"
      end
    end
  end
end