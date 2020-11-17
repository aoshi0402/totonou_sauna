require "rails_helper"

RSpec.describe "User", type: :model do
  describe "バリデーションテスト" do
    let(:user) { create(:user) }
    subject { user.valid? }
    it "登録できること" do
      is_expected.to eq true
    end

    context "name" do
      it "空欄でないこと" do
        user.name = ""
        is_expected.to eq false
      end
      it "空欄の場合はエラーが出る" do
        user.name = ""
        user.valid?
        expect(user.errors[:name]).to include("を入力してください")
      end
      it "重複していないこと" do
        another_user = build(:user, name: user.name)
        expect(another_user).not_to be_valid
      end
      it "重複していたらエラーが出る" do
        another_user = build(:user, name: user.name)
        another_user.valid?
        expect(another_user.errors[:name]).to include("はすでに存在します")
      end
      it "20文字以内であること" do
        user.name = Faker::Lorem.characters(number:21)
        is_expected.to eq false
      end
      it "20文字以内でないとエラーが出る" do
        user.name = Faker::Lorem.characters(number:21)
        user.valid?
        expect(user.errors[:name]).to include("は20文字以内で入力してください")
      end
    end

    context 'address_city' do
      it '50文字以内であること' do
        user.address_city = Faker::Lorem.characters(number:51)
        is_expected.to eq false
      end
      it '50文字以内でないとエラーが出る' do
        user.address_city = Faker::Lorem.characters(number:51)
        user.valid?
        expect(user.errors[:address_city]).to include("は50文字以内で入力してください")
      end
    end

    context 'address_street' do
      it '50文字以内であること' do
        user.address_street = Faker::Lorem.characters(number:51)
        is_expected.to eq false
      end
      it '50文字以内でないとエラーが出る' do
        user.address_street = Faker::Lorem.characters(number:51)
        user.valid?
        expect(user.errors[:address_street]).to include("は50文字以内で入力してください")
      end
    end

    context 'address_building' do
      it '50文字以内であること' do
        user.address_building = Faker::Lorem.characters(number:51)
        is_expected.to eq false
      end
      it '50文字以内でないとエラーが出る' do
        user.address_building = Faker::Lorem.characters(number:51)
        user.valid?
        expect(user.errors[:address_building]).to include("は50文字以内で入力してください")
      end
    end

    context 'introduction' do
      it '50文字以内であること' do
        user.introduction = Faker::Lorem.characters(number:201)
        is_expected.to eq false
      end
      it '50文字以内でないとエラーが出る' do
        user.introduction = Faker::Lorem.characters(number:151)
        user.valid?
        expect(user.errors[:introduction]).to include("は150文字以内で入力してください")
      end
    end

    context 'passwordカラム' do
      it '空欄でないこと' do
        user.password = ''
        is_expected.to eq false
      end
      it '空欄の場合はエラーが出る' do
        user.password = ''
        user.valid?
        expect(user.errors[:password]).to include("が入力されていません。")
      end
      it '6文字以上であること' do
        user.password = Faker::Lorem.characters(number: 1)
        is_expected.to eq false
      end
      it '６文字未満の場合はエラーが出る' do
        user.password = Faker::Lorem.characters(number: 1)
        user.valid?
        expect(user.errors[:password]).to include("は6文字以上に設定して下さい。")
      end
      it 'パスワードが不一致' do
        user.password = "password1"
        user.password_confirmation = "password2"
        user.valid?
        expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
      end
    end
  end
end