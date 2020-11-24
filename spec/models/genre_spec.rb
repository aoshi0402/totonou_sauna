require "rails_helper"

RSpec.describe Genre, type: :model do
  describe "バリデーション" do
    let(:genre) { create(:genre) }
    subject { genre.valid? }
    it "ジャンルが作成できること" do
      is_expected.to eq true
    end

    context "name" do
      it "空欄でないこと" do
        genre.name = ""
        is_expected.to eq false
      end
      it "空欄の場合はエラーが出る" do
        genre.name = ""
        genre.valid?
        expect(genre.errors[:name]).to include("を入力してください")
      end
      it "20文字以内であること" do
        genre.name = Faker::Lorem.characters(number: 21)
        is_expected.to eq false
      end
      it "20文字以内でないとエラーが出る" do
        genre.name = Faker::Lorem.characters(number:21)
        genre.valid?
        expect(genre.errors[:name]).to include("は20文字以内で入力してください")
      end
    end
  end

  describe "アソシエーションのテスト" do  
    let(:association) do
      described_class.reflect_on_association(target)
    end

    context "SaunaGenreモデルとのアソシエーション" do
      let(:target) { :sauna_genres }

      it "1:Nとなっている" do
        expect(association.macro).to eq :has_many
      end
      it  "モデル名がSaunaGenreになっている" do
        expect(association.class_name).to eq "SaunaGenre" 
      end
    end
  end
end