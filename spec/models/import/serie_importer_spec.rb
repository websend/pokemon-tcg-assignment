require 'rails_helper'

module Import
  RSpec.describe SerieImporter, type: :model do
    describe ".run" do
      let(:fake_result) do
        [
          {
            "id" => "base",
            "logo" => "https://assets.tcgdex.net/en/base/base1/logo",
            "name" => "Base"
          },
          {
            "id" => "gym",
            "logo" => "https://assets.tcgdex.net/en/gym/gym1/logo",
            "name" => "Gym"
          }
        ]
      end

      before do
        allow(PokemonApi::Graphql::V2::Requests::Series).
          to receive(:retrieve).
          and_return(fake_result)
      end

      before { described_class.run }

      it "retrieves Pokemon series and stores them in the database" do
        described_class.run

        expect(CardSerie.count).to eql 2

        attributes = CardSerie.all.map(&:attributes)

        expect(attributes).to match_array(
          [
            a_hash_including(
              "unique_id" => "base",
              "logo_url" => "https://assets.tcgdex.net/en/base/base1/logo",
              "name" => "Base"
            ),
            a_hash_including(
              "unique_id" => "gym",
              "logo_url" => "https://assets.tcgdex.net/en/gym/gym1/logo",
              "name" => "Gym"
            )
          ]
        )
      end
    end
  end
end
