class CardsController < ApplicationController
  def index
    collection = Card.
      with_image.
      with_card_set_id(params[:card_set_id]).
      with_name(params[:name]).
      with_rarity(params[:rarity]).
      with_owned_by(params[:trainer_id]).
      order(:name)

    @pagy, @cards = pagy(
      collection,
      items: params.fetch(:per_page, 20),
      link_extra: "data-turbo-action='advance'"
    )
  end
end
