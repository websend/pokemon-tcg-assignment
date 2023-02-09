module PokemonApi
  module Graphql
    module V2
      module Requests
        class Serie
          def self.retrieve(id)
            response = PokemonApi::Graphql::V2::Client.query(
              <<~GRAPHQL
                query($id: ID!) {
                  serie(id: $id) {
                    id
                    logo
                    name
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
