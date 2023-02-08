module Import
  class CardSetImporterJob < ApplicationJob
    queue_as :default

    def perform
      tcg_sets = PokemonApi::Graphql::V2::Requests::Sets.retrieve

      tcg_sets.each do |tcg_set|
        tcg_card_count = tcg_set["cardCount"]

        CardSet.find_or_create_by(
          unique_id: tcg_set["id"],
          logo_url: tcg_set["logo"],
          name: tcg_set["name"],
          symbol_url: tcg_set["symbol"],
          card_serie: CardSerie.find_by(unique_id: tcg_set.dig("serie", "id")),
          release_date: tcg_set["releaseDate"],
          first_edition_cards: tcg_card_count["firstEd"],
          holo_cards: tcg_card_count["holo"],
          normal_cards: tcg_card_count["normal"],
          reverse_cards: tcg_card_count["reverse"],
          total_cards: tcg_card_count["total"]
        )
      end

      true
    end
  end
end
