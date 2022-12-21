require "rails_helper"

module PokemonApi
  module Graphql
    module V2
      module Requests
        RSpec.describe Sets do
          describe ".retrieve" do
            let(:response_body) do
              [
                {
                  "id" => "base",
                  "cardCount" => {
                    "firstEd" => 0,
                    "holo" => 0,
                    "normal" => 0,
                    "official" => 102,
                    "reverse" => 0,
                    "total" => 102
                  },
                  "name" => "Base Set",
                  "logo" => "https://assets.tcgdex.net/en/base/base1/logo",
                  "releaseDate" => "1999-06-16",
                  "serie" => { "id" => "base" },
                  "symbol" => "https://assets.tcgdex.net/univ/base/base2/symbol"
                }
              ]
            end

            let(:response) do
              {
                "data" => {
                  "sets" => response_body
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
