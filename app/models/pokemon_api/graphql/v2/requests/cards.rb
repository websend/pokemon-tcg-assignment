module PokemonApi
  module Graphql
    module V2
      module Requests
        class Cards
          def self.retrieve
            response = PokemonApi::Graphql::V2::Client.query(
              <<~GRAPHQL
                query {
                  cards {
                    category
                    description
                    id
                    image
                    name
                    rarity
                    trainerType
                    types
                    variants {
                      firstEdition
                      holo
                      normal
                      reverse
                      wPromo
                    }
                  }
                }
              GRAPHQL
            )

            response.dig("data", "cards")
          end
        end
      end
    end
  end
end
