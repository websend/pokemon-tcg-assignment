module PokemonApi
  module Graphql
    module V2
      module Requests
        class Series
          def self.retrieve
            response = PokemonApi::Graphql::V2::Client.query(
              <<~GRAPHQL
                query {
                  series {
                    id
                    logo
                    name
                  }
                }
              GRAPHQL
            )

            response.dig("data", "series")
          end
        end
      end
    end
  end
end
