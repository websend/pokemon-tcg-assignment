require 'rails_helper'

RSpec.describe CardSet, type: :model do
  it { is_expected.to belong_to(:card_serie) }

  describe ".with_name" do
    let!(:card_set_1) { create(:card_set, name: "Violet") }
    let!(:card_set_2) { create(:card_set, name: "Scarlet") }

    context "when input is given" do
      context "and an exact match is found" do
        it "returns matching card sets" do
          result = described_class.with_name("Violet")

          expect(result).to match_array([card_set_1])
        end
      end

      context "and the name includes the given input" do
        it "returns matching card sets" do
          result = described_class.with_name("Vio")

          expect(result).to match_array([card_set_1])
        end
      end
    end

    context "when no input is given" do
      it "returns all card sets" do
        result = described_class.with_name(nil)

        expect(result).to match_array([card_set_1, card_set_2])
      end
    end
  end
end
