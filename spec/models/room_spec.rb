require "rails_helper"

RSpec.describe Room, type: :model do
	describe "アソシエーションテスト" do
    let(:association) do
      described_class.reflect_on_association(target)
    end

    context "Messageモデルとのアソシエーション" do
      let(:target) { :messages }

      it "1:Nとなっている" do
        expect(association.macro).to eq :has_many
      end
      it "モデル名がMessageになっている" do
        expect(association.class_name).to eq "Message"
      end
    end
      
      
    context "Entryモデルとのアソシエーション" do
      let(:target) { :entries }

      it "1:Nとなっている" do
        expect(association.macro).to eq :has_many
      end
      it "モデル名がEntryになっている" do
        expect(association.class_name).to eq "Entry"
      end
    end
  end
end