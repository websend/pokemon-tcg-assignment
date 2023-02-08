module Import
  class CardSerieImporterJob < ApplicationJob
    queue_as :default

    def perform
      tcg_series = PokemonApi::Graphql::V2::Requests::Series.retrieve

      tcg_series.each do |tcg_serie|
        CardSerie.find_or_create_by(
          unique_id: tcg_serie["id"],
          logo_url: tcg_serie["logo"],
          name: tcg_serie["name"]
        )
      end

      true
    end
  end
end
