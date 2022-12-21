require "rails_helper"

module PokemonApi
  module Graphql
    module V2
      module Requests
        RSpec.describe Cards do
          describe ".retrieve" do
            let(:response_body) do
              [
                {
                  "name" => "Alakazam",
                  "category" => "Pokemon",
                  "description" => nil,
                  "image" => "https://assets.tcgdex.net/en/base/base4/1",
                  "rarity" => "Rare",
                  "trainerType" => nil,
                  "types" => [
                    "Psychic"
                  ],
                  "variants" => {
                    "firstEdition" => false,
                    "holo" => true,
                    "normal" => true,
                    "reverse" => true,
                    "wPromo" => false
                  }
                }
              ]
            end

            let(:response) do
              {
                "data" => {
                  "cards" => response_body
                }
              }
            end

            before { expect(PokemonApi::Graphql::V2::Client).to receive(:query).and_return(response) }

            context "when a valid response is given" do
              it "returns a parsed response" do
                result = described_class.retrieve

                expect(result).to eql response_body
              end
            end
          end
        end
      end
    end
  end
end
