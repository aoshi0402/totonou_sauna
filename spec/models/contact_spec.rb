require "rails_helper"

RSpec.describe Contact, type: :model do
  describe "バリデーション" do
    subject { contact.valid? }

    let(:contact) { build(:contact) }

    it "お問い合わせが送信できること" do
      is_expected.to eq true
    end

    context "name" do
      it "空欄でないこと" do
        contact.name = ""
        is_expected.to eq false
      end
      it "空欄の場合はエラーが出る" do
        contact.name = ""
        contact.valid?
        expect(contact.errors[:name]).to include("を入力してください")
      end
      it "20文字以内であること" do
        contact.name = Faker::Lorem.characters(number: 21)
        is_expected.to eq false
      end
      it "20文字以内でないとエラーが出る" do
        contact.name = Faker::Lorem.characters(number: 21)
        contact.valid?
        expect(contact.errors[:name]).to include("は20文字以内で入力してください")
      end
    end

    context "email" do
      it "空欄でないこと" do
        contact.email = ""
        is_expected.to eq false
      end
      it "空欄であるとエラーがでる" do
        contact.email = ""
        contact.valid?
        expect(contact.errors[:email]).to include("を入力してください")
      end
    end

    context "title" do
      it "空欄でないこと" do
        contact.title = ""
        is_expected.to eq false
      end
      it "空欄の場合はエラーが出る" do
        contact.title = ""
        contact.valid?
        expect(contact.errors[:title]).to include("を入力してください")
      end
      it "20文字以内であること" do
        contact.title = Faker::Lorem.characters(number: 21)
        is_expected.to eq false
      end
      it "20文字以内でないとエラーが出る" do
        contact.name = Faker::Lorem.characters(number: 21)
        contact.valid?
        expect(contact.errors[:name]).to include("は20文字以内で入力してください")
      end
    end

    context "body" do
      it "空欄でないこと" do
        contact.body = ""
        is_expected.to eq false
      end
      it "空欄の場合はエラーが出る" do
        contact.body = ""
        contact.valid?
        expect(contact.errors[:body]).to include("を入力してください")
      end
      it "200文字以内であること" do
        contact.body = Faker::Lorem.characters(number: 201)
        is_expected.to eq false
      end
      it "200文字以内でないとエラーが出る" do
        contact.body = Faker::Lorem.characters(number: 201)
        contact.valid?
        expect(contact.errors[:body]).to include("は200文字以内で入力してください")
      end
    end
  end
end
