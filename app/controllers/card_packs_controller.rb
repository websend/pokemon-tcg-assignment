class CardPacksController < ApplicationController
  def index
    @pagy, @card_packs = pagy(
      CardPack.with_name(params[:name]).order(:name),
      items: params.fetch(:per_page, 3),
      link_extra: "data-turbo-action='advance'"
    )
  end
end
