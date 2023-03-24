module PokemonApi
  module Graphql
    module V2
      module Requests
        class Sets
          def self.retrieve
            response = PokemonApi::Graphql::V2::Client.query(
              <<~GRAPHQL
                query {
                  sets {
                    cardCount{
                      firstEd
                      holo
                      normal
                      official
                      reverse
                      total
                    }
                    id
                    logo
                    name
                    symbol
                    serie {
                      id
                    }
                    releaseDate
                    tcgOnline
                  }
                }
              GRAPHQL
            )

            response.dig("data", "sets")
          end
        end
      end
    end
  end
end
