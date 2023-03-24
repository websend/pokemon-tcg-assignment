module PokemonApi
  module Graphql
    module V2
      module Requests
        class Cards
          # For now, we're only retrieving the first 300 cards
          def self.retrieve
            response = PokemonApi::Graphql::V2::Client.query(
              <<~GRAPHQL
                query {
                  cards(pagination: { page: 1, count: 300 }) {
                    abilities {
                      effect
                      name
                      type
                    }
                    attacks {
                      cost
                      damage
                      effect
                      name
                    }
                    category
                    description
                    dexId
                    effect
                    energyType
                    evolveFrom
                    hp
                    id
                    illustrator
                    image
                    item {
                      effect
                      name
                    }
                    level
                    localId
                    name
                    rarity
                    regulationMark
                    resistances {
                      type
                      value
                    }
                    retreat
                    set {
                      id
                    }
                    stage
                    suffix
                    trainerType
                    types
                    variants {
                      firstEdition
                      holo
                      normal
                      reverse
                      wPromo
                    }
                    weaknesses {
                      type
                      value
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
