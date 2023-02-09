require 'rails_helper'

RSpec.describe CardSerie, type: :model do
  it { is_expected.to have_many(:card_sets) }

  describe ".with_name" do
    let!(:card_serie_1) { create(:card_serie, name: "Violet") }
    let!(:card_serie_2) { create(:card_serie, name: "Scarlet") }

    context "when input is given" do
      context "and an exact match is found" do
        it "returns matching card series" do
          result = described_class.with_name("Violet")

          expect(result).to match_array([card_serie_1])
        end
      end

      context "and the name includes the given input" do
        it "returns matching card series" do
          result = described_class.with_name("Vio")

          expect(result).to match_array([card_serie_1])
        end
      end
    end

    context "when no input is given" do
      it "returns all card series" do
        result = described_class.with_name(nil)

        expect(result).to match_array([card_serie_1, card_serie_2])
      end
    end
  end
end
