require "rails_helper"

RSpec.describe Sauna, type: :model do
  describe "バリデーションテスト" do

    let(:user) { build(:user) }
    let(:sauna) { build(:sauna, user: user) }

    subject { sauna.valid? }

    it "サウナの新規登録ができること" do
      is_expected.to eq true
    end

    context "image" do
      it "空欄でないこと" do
        sauna.image = ""
        is_expected.to eq false
      end
    end

    context "name" do
      it "空欄でないこと" do
        sauna.name = ""
        is_expected.to eq false
      end
      it "空欄の場合はエラーが出る" do
        sauna.name = ""
        sauna.valid?
        expect(sauna.errors[:name]).to include("を入力してください")
      end
      it "重複していないこと" do
        another_sauna = create(:sauna, name: sauna.name)
        expect(sauna).not_to be_valid
      end
      it "重複していたらエラーが出る" do
        another_sauna = create(:sauna, name: sauna.name)
        sauna.valid?
        expect(sauna.errors[:name]).to include("はすでに存在します")
      end
      it "50文字以内であること" do
        sauna.name = Faker::Lorem.characters(number:51)
        is_expected.to eq false
      end
      it "50文字以内でないとエラーが出る" do
        sauna.name = Faker::Lorem.characters(number:51)
        sauna.valid?
        expect(sauna.errors[:name]).to include("は50文字以内で入力してください")
      end
    end

    context "postcode" do
      it "正規表現が正しいこと" do
        sauna.postcode = Faker::Address.postcode.gsub("-","")
        expect(sauna.postcode).to match(/\A\d{7}\z/)
      end
      it "半角英数字以外の場合はエラーが出る" do
        sauna.postcode = "aaa2222"
        sauna.valid?
        expect(sauna.errors[:postcode]).to include("は不正な値です")
      end
    end

    context "address_city" do
      it "50文字以内であること" do
        sauna.address_city = Faker::Lorem.characters(number:51)
        is_expected.to eq false
      end
      it "50文字以内でないとエラーが出る" do
        sauna.address_city = Faker::Lorem.characters(number:51)
        sauna.valid?
        expect(sauna.errors[:address_city]).to include("は50文字以内で入力してください")
      end
    end

    context "address_street" do
      it "50文字以内であること" do
        sauna.address_street = Faker::Lorem.characters(number:51)
        is_expected.to eq false
      end
      it "50文字以内でないとエラーが出る" do
        sauna.address_street = Faker::Lorem.characters(number:51)
        sauna.valid?
        expect(sauna.errors[:address_street]).to include("は50文字以内で入力してください")
      end
    end

    context "address_building" do
      it "50文字以内であること" do
        sauna.address_building = Faker::Lorem.characters(number:51)
        is_expected.to eq false
      end
      it "50文字以内でないとエラーが出る" do
        sauna.address_building = Faker::Lorem.characters(number:51)
        sauna.valid?
        expect(sauna.errors[:address_building]).to include("は50文字以内で入力してください")
      end
    end

    context "introduction" do
      it "400文字以内であること" do
        sauna.introduction = Faker::Lorem.characters(number:401)
        is_expected.to eq false
      end
      it "400文字以内でないとエラーが出る" do
        sauna.introduction = Faker::Lorem.characters(number:401)
        sauna.valid?
        expect(sauna.errors[:introduction]).to include("は400文字以内で入力してください")
      end
    end

    context "business_hour" do
      it "空欄でないこと" do
        sauna.business_hour = ""
        is_expected.to eq false
      end
      it "100文字以内であること" do
        sauna.business_hour = Faker::Lorem.characters(number: 101)
        is_expected.to eq false
      end
    end

    context "water_temperature" do
      it "空欄でないこと" do
        sauna.water_temperature = ""
        is_expected.to eq false
      end
      it "空欄であるとエラーが出る" do
        sauna.water_temperature = ""
        sauna.valid?
        expect(sauna.errors[:water_temperature]).to include("を入力してください")
      end
    end

    context "sauna_temperature" do
      it "空欄でないこと" do
        sauna.sauna_temperature = ""
        is_expected.to eq false
      end
      it "空欄であるとエラーが出る" do
        sauna.sauna_temperature = ""
        sauna.valid?
        expect(sauna.errors[:sauna_temperature]).to include("を入力してください")
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

    context "Reviewモデルとのアソシエーション" do
      let(:target) { :reviews }

      it "1:Nとなっている" do
        expect(association.macro).to eq :has_many
      end
      it  "モデル名がReviewになっている" do
        expect(association.class_name).to eq "Review" 
      end
    end

    context "Ikitaiモデルとのアソシエーション" do
      let(:target) { :ikitais }

      it "1:Nとなっている" do
        expect(association.macro).to eq :has_many
      end
      it  "モデル名がIkitaiになっている" do
        expect(association.class_name).to eq "Ikitai" 
      end
    end

    context "Foodモデルとのアソシエーション" do
      let(:target) { :foods }

      it "1:Nとなっている" do
        expect(association.macro).to eq :has_many
      end
      it  "モデル名がFoodになっている" do
        expect(association.class_name).to eq "Food" 
      end
    end

    context "Genreモデルとのアソシエーション" do
      let(:target) { :genres}

      it "1:Nとなっている" do
        expect(association.macro).to eq :has_many
      end
      it  "モデル名がGenreになっている" do
        expect(association.class_name).to eq "Genre" 
      end
    end
    
    context "SaunaGenreモデルとのアソシエーション" do
      let(:target) { :sauna_genres}

      it "1:Nとなっている" do
        expect(association.macro).to eq :has_many
      end
      it  "モデル名がSaunaGenreになっている" do
        expect(association.class_name).to eq "SaunaGenre" 
      end
    end
  end
end