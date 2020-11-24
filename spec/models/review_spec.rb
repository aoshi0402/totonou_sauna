require "rails_helper"

RSpec.describe Review, type: :model do
  describe "バリデーション" do
    let(:user) { build(:user) }
    let(:sauna) { build(:sauna, user: user) }
    let(:review) { build(:review, user: user, sauna: sauna) }
    subject { review.valid? }
    it "レビューが作成できること" do
      is_expected.to eq true
    end

    context "title" do
      it "空欄でないこと" do
        review.title = ""
        is_expected.to eq false
      end
      it "50文字以内であること" do
        review.title = Faker::Lorem.characters(number: 51)
        is_expected.to eq false
      end
    end

    context "body" do
      it "空欄でないこと" do
        review.body = ""
        is_expected.to eq false
      end
      it "200文字以内であること" do
        review.body = Faker::Lorem.characters(number: 201)
        is_expected.to eq false
      end
    end

    context "score" do
      it "空欄でないこと" do
        review.score = ""
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

    context "Likeモデルとのアソシエーション" do
      let(:target) { :likes }

      it "1:Nとなっている" do
        expect(association.macro).to eq :has_many
      end
      it  "モデル名がLikeになっている" do
        expect(association.class_name).to eq "Like" 
      end
    end

    context "Commentモデルとのアソシエーション" do
      let(:target) { :comments }

      it "1:Nとなっている" do
        expect(association.macro).to eq :has_many
      end
      it  "モデル名がCommnetになっている" do
        expect(association.class_name).to eq "Comment" 
      end
    end
  end
end