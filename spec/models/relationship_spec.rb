require "rails_helper"

RSpec.describe Relationship, type: :model do
  describe "アソシエーション" do
    let(:association) do
      described_class.reflect_on_association(target)
    end

    context "followingとの関係" do
      let(:target) { :followed }

      it "N:1となっている" do
        expect(association.macro).to eq :belongs_to
      end
    end

    context "followerとの関係" do
      let(:target) { :follower }

      it "N:1となっている" do
        expect(association.macro).to eq :belongs_to
      end
    end
  end
end
