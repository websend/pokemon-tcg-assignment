module PokemonApi
  module Graphql
    module V2
      module Requests
        class Card
          def self.retrieve(id, set)
            response = PokemonApi::Graphql::V2::Client.query(
              <<~GRAPHQL
                query($id: ID!, $set: String) {
                  card(id: $id, set: $set) {
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
          end
        end
      end
    end
  end
end
