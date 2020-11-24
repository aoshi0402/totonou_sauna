require "rails_helper"

RSpec.describe Food, type: :model do
  describe "バリデーション" do
    let(:user) { create(:user) }
    let(:sauna) { create(:sauna, user: user) }
    let(:food) { create(:food, user: user, sauna: sauna) }
    subject { food.valid? }
    it "サウナ飯が登録できること" do
      is_expected.to eq true
    end

    context "name" do
      it "空欄でないこと" do
        food.name = ""
        is_expected.to eq false
      end
      it "空欄の場合はエラーが出る" do
        food.name = ""
        food.valid?
        expect(food.errors[:name]).to include("を入力してください")
      end
      it "20文字以内であること" do
        food.name = Faker::Lorem.characters(number: 21)
        is_expected.to eq false
      end
      it "20文字以内でないとエラーが出る" do
        food.name = Faker::Lorem.characters(number:21)
        food.valid?
        expect(food.errors[:name]).to include("は20文字以内で入力してください")
      end
    end

    context "introduction" do
      it "空欄でないこと" do
        food.introduction = ""
        is_expected.to eq false
      end
      it "空欄の場合はエラーが出る" do
        food.introduction = ""
        food.valid?
        expect(food.errors[:introduction]).to include("を入力してください")
      end
      it "100文字以内であること" do
        food.introduction = Faker::Lorem.characters(number: 101)
        is_expected.to eq false
      end
      it "100文字以内でないとエラーが出る" do
        food.introduction = Faker::Lorem.characters(number:101)
        food.valid?
        expect(food.errors[:introduction]).to include("は100文字以内で入力してください")
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
      it  "モデル名がUserになっている" do
        expect(association.class_name).to eq "User" 
      end
    end

    context "Saunaモデルとのアソシエーション" do
      let(:target) { :sauna }

      it "N:1となっている" do
        expect(association.macro).to eq :belongs_to
      end
      it  "モデル名がSaunaになっている" do
        expect(association.class_name).to eq "Sauna" 
      end
    end
  end
end