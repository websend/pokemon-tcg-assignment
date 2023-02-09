require 'rails_helper'

module Import
  RSpec.describe CardSetImporter, type: :model do
    describe ".run" do
      let(:fake_result) do
        [
          {
            "cardCount" => {
              "firstEd" => 0,
              "holo" => 137, 
              "normal" => 93,
              "official" => 159,
              "reverse" => 112,
              "total" => 230
            },
            "id" => "swsh12.5",
            "logo" => "https://assets.tcgdex.net/en/swsh/swsh12.5/logo",
            "name" => "Crown Zenith",
            "symbol" => nil,
            "serie" => { "id" => "swsh" },
            "releaseDate" => "2023-01-20",
            "tcgOnline" => nil
          }
        ]
      end

      before do
        allow(PokemonApi::Graphql::V2::Requests::Sets).
          to receive(:retrieve).
          and_return(fake_result)
      end

      let!(:card_serie) { create(:card_serie, unique_id: "swsh") }

      before { described_class.run }

      it "retrieves Pokemon sets and stores them in the database" do
        described_class.run

        expect(CardSet.count).to eql 1

        card_set = CardSet.first

        expect(card_set.attributes).to match(
          a_hash_including(
            "unique_id" => "swsh12.5",
            "logo_url" => "https://assets.tcgdex.net/en/swsh/swsh12.5/logo",
            "name" => "Crown Zenith",
            "symbol_url" => nil,
            "card_serie_id" => card_serie.id,
            "release_date" => "2023-01-20".to_date,
            "first_edition_cards" => 0,
            "holo_cards" => 137,
            "normal_cards" => 93,
            "official_cards" => 159,
            "reverse_cards" => 112,
            "total_cards" => 230
          )
        )
      end
    end
  end
end
