module PokemonApi
  module Graphql
    module V2
      module Requests
        class Set
          def self.retrieve(id)
            response = PokemonApi::Graphql::V2::Client.query(
              <<~GRAPHQL
                query($id: ID!) {
                  set(id: $id) {
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
          end
        end
      end
    end
  end
end
