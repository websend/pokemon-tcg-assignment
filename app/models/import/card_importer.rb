module Import
  class CardImporter
    def self.run
      results = PokemonApi::Graphql::V2::Requests::Cards.retrieve

      results.each do |tcg_card|
        card = import_card(tcg_card)

        importer = new(card, tcg_card)

        importer.import_and_link_abilities
        importer.import_and_link_attacks
        importer.import_and_link_pokemon_types
        importer.import_and_link_weaknesses
        importer.import_and_link_resistances
      end

      true
    end

    def self.import_card(tcg_card)
      tcg_card_variants = tcg_card["variants"]

      Card.find_or_create_by(
        unique_id: tcg_card["id"],
        category: tcg_card["category"],
        description: tcg_card["description"],
        dex_id: Array(tcg_card["dexId"]).first,
        effect: tcg_card["effect"],
        energy_type: tcg_card["energyType"],
        evolve_from: tcg_card["evolveFrom"],
        hp: tcg_card["hp"],
        illustrator: tcg_card["illustrator"],
        image_url: tcg_card["image"],
        level: tcg_card["level"],
        local_id: tcg_card["localId"],
        name: tcg_card["name"],
        rarity: tcg_card["rarity"],
        regulation_mark: tcg_card["regulationMark"],
        retreat: tcg_card["retreat"],
        card_set: CardSet.find_by(unique_id: tcg_card.dig("set", "id")),
        stage: tcg_card["stage"],
        suffix: tcg_card["suffix"],
        trainer_type: tcg_card["trainerType"],
        first_edition: tcg_card_variants["firstEdition"],
        holo: tcg_card_variants["holo"],
        normal: tcg_card_variants["normal"],
        reverse: tcg_card_variants["reverse"],
        w_promo: tcg_card_variants["wPromo"]
      )
    end

    attr_reader :card, :tcg_card

    def initialize(card, tcg_card)
      @card = card
      @tcg_card = tcg_card
    end

    def import_and_link_abilities
      tcg_abilities = Array(tcg_card["abilities"]).compact

      abilities = tcg_abilities.map do |tcg_ability|
        Ability.find_or_create_by(
          effect: tcg_ability["effect"],
          name: tcg_ability["name"],
          ability_type: tcg_ability["type"]
        )
      end

      card.abilities = abilities

      true
    end

    def import_and_link_attacks
      tcg_attacks = Array(tcg_card["attacks"]).compact

      attacks = tcg_attacks.map do |tcg_attack|
        Attack.find_or_create_by(
          cost: tcg_attack["cost"],
          damage: tcg_attack["damage"],
          effect: tcg_attack["effect"],
          name: tcg_attack["name"]
        )
      end

      card.attacks = attacks

      true
    end

    def import_and_link_pokemon_types
      tcg_pokemon_types = Array(tcg_card["types"]).compact

      pokemon_types = tcg_pokemon_types.map do |tcg_pokemon_type|
        PokemonType.find_or_create_by(name: tcg_pokemon_type)
      end

      card.pokemon_types = pokemon_types

      true
    end

    def import_and_link_resistances
      tcg_resistances = Array(tcg_card["resistances"]).compact

      resistances = tcg_resistances.map do |tcg_resistance|
        Resistance.find_or_create_by(
          resistance_type: tcg_resistance["type"],
          value: tcg_resistance["value"],
        )
      end

      card.resistances = resistances

      true
    end

    def import_and_link_weaknesses
      tcg_weaknesses = Array(tcg_card["weaknesses"]).compact

      weaknesses = tcg_weaknesses.map do |tcg_weakness|
        Weakness.find_or_create_by(
          weakness_type: tcg_weakness["type"],
          value: tcg_weakness["value"],
        )
      end

      card.weaknesses = weaknesses

      true
    end
  end
end
