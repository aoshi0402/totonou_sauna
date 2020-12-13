require "rails_helper"

RSpec.describe User, type: :model do
  describe "バリデーションテスト" do
    subject { user.valid? }

    let(:user) { build(:user) }
    let(:sauna) { build(:sauna, user: user) }

    # subjectという変数に当てはめる場合は、expect(処理内容).toは is_expected.to に置き換え可能

    it "ユーザー登録に成功する" do
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
        another_user = create(:user, name: user.name)
        expect(user).not_to be_valid
      end
      it "重複していたらエラーが出る" do
        another_user = create(:user, name: user.name)
        user.valid?
        expect(user.errors[:name]).to include("はすでに存在します")
      end
      it "20文字以内であること" do
        user.name = Faker::Lorem.characters(number: 21)
        is_expected.to eq false
      end
      it "20文字以内でないとエラーが出る" do
        user.name = Faker::Lorem.characters(number: 21)
        user.valid?
        expect(user.errors[:name]).to include("は20文字以内で入力してください")
      end
    end

    context "email" do
      it "空欄でないこと" do
        user.email = ""
        is_expected.to eq false
      end
      it "空欄の場合はエラーが出る" do
        user.email = ""
        user.valid?
        expect(user.errors[:email]).to include("が入力されていません。")
      end
      it "重複していないこと" do
        another_user = create(:user, email: user.email)
        expect(user).not_to be_valid
      end
      it "重複していたらエラーが出る" do
        another_user = create(:user, email: user.email)
        user.valid?
        expect(user.errors[:email]).to include("は既に使用されています。")
      end
    end

    context "postcode" do
      it "正規表現が正しいこと" do
        user.postcode = Faker::Address.postcode.gsub("-", "")
        expect(user.postcode).to match(/\A\d{7}\z/)
      end
      it "半角英数字以外の場合はエラーが出る" do
        user.postcode = "aaa2222"
        user.valid?
        expect(user.errors[:postcode]).to include("は不正な値です")
      end
    end

    context "address_city" do
      it "50文字以内であること" do
        user.address_city = Faker::Lorem.characters(number: 51)
        is_expected.to eq false
      end
      it "50文字以内でないとエラーが出る" do
        user.address_city = Faker::Lorem.characters(number: 51)
        user.valid?
        expect(user.errors[:address_city]).to include("は50文字以内で入力してください")
      end
    end

    context "address_street" do
      it "50文字以内であること" do
        user.address_street = Faker::Lorem.characters(number: 51)
        is_expected.to eq false
      end
      it "50文字以内でないとエラーが出る" do
        user.address_street = Faker::Lorem.characters(number: 51)
        user.valid?
        expect(user.errors[:address_street]).to include("は50文字以内で入力してください")
      end
    end

    context "address_building" do
      it "50文字以内であること" do
        user.address_building = Faker::Lorem.characters(number: 51)
        is_expected.to eq false
      end
      it "50文字以内でないとエラーが出る" do
        user.address_building = Faker::Lorem.characters(number: 51)
        user.valid?
        expect(user.errors[:address_building]).to include("は50文字以内で入力してください")
      end
    end

    context "introduction" do
      it "150文字以内であること" do
        user.introduction = Faker::Lorem.characters(number: 151)
        is_expected.to eq false
      end
      it "150文字以内でないとエラーが出る" do
        user.introduction = Faker::Lorem.characters(number: 151)
        user.valid?
        expect(user.errors[:introduction]).to include("は150文字以内で入力してください")
      end
    end

    context "passwordカラム" do
      it "空欄でないこと" do
        user.password = ""
        is_expected.to eq false
      end
      it "空欄の場合はエラーが出る" do
        user.password = ""
        user.valid?
        expect(user.errors[:password]).to include("が入力されていません。")
      end
      it "6文字以上であること" do
        user.password = Faker::Lorem.characters(number: 1)
        is_expected.to eq false
      end
      it "6文字未満はエラーが出る" do
        user.password = Faker::Lorem.characters(number: 1)
        user.valid?
        expect(user.errors[:password]).to include("は6文字以上に設定して下さい。")
      end
      it "パスワードが不一致" do
        user.password = "password1"
        user.password_confirmation = "password2"
        user.valid?
        expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
      end
    end
  end

  describe "アソシエーションのテスト" do
    let(:association) do
      described_class.reflect_on_association(target)
    end

    context "Saunaモデルとのアソシエーション" do
      let(:target) { :saunas }

      it "1:Nとなっている" do
        expect(association.macro).to eq :has_many
      end
      it "モデル名がSaunaになっている" do
        expect(association.class_name).to eq "Sauna"
      end
    end

    context "Ikitaiモデルとのアソシエーション" do
      let(:target) { :ikitais }

      it "1:Nとなっている" do
        expect(association.macro).to eq :has_many
      end
      it "モデル名がIkitaiになっている" do
        expect(association.class_name).to eq "Ikitai"
      end
    end

    context "Likeモデルとのアソシエーション" do
      let(:target) { :likes }

      it "1:Nとなっている" do
        expect(association.macro).to eq :has_many
      end
      it "モデル名がLikeになっている" do
        expect(association.class_name).to eq "Like"
      end
    end

    context "Foodモデルとのアソシエーション" do
      let(:target) { :foods }

      it "1:Nとなっている" do
        expect(association.macro).to eq :has_many
      end
      it "モデル名がFoodになっている" do
        expect(association.class_name).to eq "Food"
      end
    end

    context "Reviewモデルとのアソシエーション" do
      let(:target) { :reviews }

      it "1:Nとなっている" do
        expect(association.macro).to eq :has_many
      end
      it "モデル名がReviewになっている" do
        expect(association.class_name).to eq "Review"
      end
    end

    context "Commentモデルとのアソシエーション" do
      let(:target) { :comments }

      it "1:Nとなっている" do
        expect(association.macro).to eq :has_many
      end
      it "モデル名がCommentになっている" do
        expect(association.class_name).to eq "Comment"
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

    context "Messageモデルとのアソシエーション" do
      let(:target) { :messages }

      it "1:Nとなっている" do
        expect(association.macro).to eq :has_many
      end
      it "モデル名がMessageになっている" do
        expect(association.class_name).to eq "Message"
      end
    end

    context "Notificationモデル(active_notifications)との関連" do
      let(:target) { :active_notifications }

      it "1:Nとなっている" do
        expect(association.macro).to eq :has_many
      end
      it "モデル名がNotificationになっている" do
        expect(association.class_name).to eq "Notification"
      end
    end

    context "Notificationモデル(passive_notifications)との関連" do
      let(:target) { :passive_notifications }

      it "1:Nとなっている" do
        expect(association.macro).to eq :has_many
      end
      it "モデル名がNotificationになっている" do
        expect(association.class_name).to eq "Notification"
      end
    end

    context "Relationshipモデル(relationships)との関係" do
      let(:target) { :relationships }

      it "1:Nとなっている" do
        expect(association.macro).to eq :has_many
      end
      it "結合するモデルのクラスはRelationship" do
        expect(association.class_name).to eq "Relationship"
      end
    end

    context "Relationshipモデル(reverse_of_relationships)との関係" do
      let(:target) { :reverse_of_relationships }

      it "1:Nとなっている" do
        expect(association.macro).to eq :has_many
      end
      it "結合するモデルのクラスはRelationship" do
        expect(association.class_name).to eq "Relationship"
      end
    end

    context "自分がフォローしているユーザーとの関連（自己結合型多対多）" do
      let(:target) { :followings }

      it "1:Nとなっている（中間テーブルrelationshipsを介すので自己結合型多対多）" do
        expect(association.macro).to eq :has_many
      end
      it "結合するモデルのクラスはUser(Follower)" do
        expect(association.class_name).to eq "User"
      end
    end

    context "自分がフォローされるユーザーとの関連（自己結合型多対多）" do
      let(:target) { :followers }

      it "1:Nとなっている(中間テーブルpassive_relationshipsを介すので自己結合型多対多）" do
        expect(association.macro).to eq :has_many
      end
      it "結合するモデルのクラスはUser(Following)" do
        expect(association.class_name).to eq "User"
      end
    end
  end
end
