require 'rails_helper'

RSpec.describe Card, type: :model do
  it { is_expected.to belong_to(:card_set) }

  it { is_expected.to have_and_belong_to_many(:abilities) }
  it { is_expected.to have_and_belong_to_many(:attacks) }
  it { is_expected.to have_and_belong_to_many(:pokemon_types) }
  it { is_expected.to have_and_belong_to_many(:resistances) }
  it { is_expected.to have_and_belong_to_many(:weaknesses) }

  describe "scopes" do
    describe ".with_card_set_id" do
      let!(:card_set_1) { create(:card_set) }
      let!(:card_set_2) { create(:card_set) }
      let!(:card_1) { create(:card, card_set: card_set_1) }
      let!(:card_2) { create(:card, card_set: card_set_2) }

      context "when a card set ID is given" do
        it "only returns cards with the given card set ID" do
          result = described_class.with_card_set_id(card_set_2.id)

          expect(result).to match_array([card_2])
        end
      end

      context "when no card set ID is given" do
        it "returns all cards" do
          result = described_class.with_card_set_id(nil)

          expect(result).to match_array([card_1, card_2])
        end
      end
    end

    describe ".with_name" do
      let!(:card_1) { create(:card, name: "Mew") }
      let!(:card_2) { create(:card, name: "MewTwo") }
      let!(:card_3) { create(:card, name: "Eevee") }

      context "when input is given" do
        context "and an exact match is found" do
          it "returns matching cards" do
            result = described_class.with_name("Eevee")

            expect(result).to match_array([card_3])
          end
        end

        context "and the name includes the given input" do
          it "returns matching cards" do
            result = described_class.with_name("Me")

            expect(result).to match_array([card_1, card_2])
          end
        end
      end

      context "when no input is given" do
        it "returns all cards" do
          result = described_class.with_name(nil)

          expect(result).to match_array([card_1, card_2, card_3])
        end
      end
    end

    describe ".with_rarity" do
      let!(:card_1) { create(:card, rarity: "Rare") }
      let!(:card_2) { create(:card, rarity: "Super Rare") }

      context "when input is given" do
        it "returns matching cards" do
          result = described_class.with_rarity("Super Rare")

          expect(result).to match_array([card_2])
        end
      end

      context "when no input is given" do
        it "returns all cards" do
          result = described_class.with_rarity(nil)

          expect(result).to match_array([card_1, card_2])
        end
      end
    end

    describe ".with_image" do
      let!(:card_1) { create(:card, image_url: "http://example.com") }
      let!(:card_2) { create(:card, image_url: nil) }

      it "only returns card with an image" do
        result = described_class.with_image

        expect(result).to match_array([card_1])
      end
    end
  end
end
