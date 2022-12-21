module PokemonApi
  module Graphql
    module V2
      class Client
        include HTTParty

        base_uri ENV["POKEMON_API_URI"]

        class << self
          def query(query)
            get(
              "/",
              body: { query: query }
            )
          end
        end
      end
    end
  end
end
