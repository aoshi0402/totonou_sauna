require "rails_helper"

RSpec.describe Comment, type: :model do
  describe "コメントモデルのバリデーション" do
    let(:user) { build(:user) }
    let(:sauna) { build(:sauna, user: user) }
    let(:review) { build(:review, user: user, sauna: sauna) }
    let(:comment) { build(:comment, user: user, review: review) }

    subject { comment.valid? }
    it "作成できること" do
      is_expected.to eq true
    end

    context "title" do
      it "空欄でないこと" do
        comment.title = ""
        is_expected.to eq false
      end
      it "20文字以内であること" do
        comment.title = Faker::Lorem.characters(number: 21)
        is_expected.to eq false
      end
    end

    context "body" do
      it "空欄でないこと" do
        comment.body = ""
        is_expected.to eq false
      end
      it "100文字以内であること" do
        comment.body = Faker::Lorem.characters(number: 101)
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

    context "Reviewモデルとのアソシエーション" do
      let(:target) { :review }

      it "N:1となっている" do
        expect(association.macro).to eq :belongs_to
      end
      it  "モデル名がReviewになっている" do
        expect(association.class_name).to eq "Review" 
      end
    end
  end
end