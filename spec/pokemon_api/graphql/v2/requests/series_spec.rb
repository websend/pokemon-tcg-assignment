require "rails_helper"

module PokemonApi
  module Graphql
    module V2
      module Requests
        RSpec.describe Series do
          describe ".retrieve" do
            let(:response_body) do
              [
                {
                  "id" => "swsh",
                  "name" => "Sword & Shield",
                  "logo" => "https://assets.tcgdex.net/en/swsh/swshp/logo"
                }
              ]
            end

            let(:response) do
              {
                "data" => {
                  "series" => response_body
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
