class CreateJoinTableCardPokemonType < ActiveRecord::Migration[7.0]
  def change
    create_join_table :cards, :pokemon_types do |t|
      t.index [:card_id, :pokemon_type_id]
      t.index [:pokemon_type_id, :card_id]
    end
  end
end
