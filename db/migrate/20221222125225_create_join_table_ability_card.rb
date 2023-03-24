class CreateJoinTableAbilityCard < ActiveRecord::Migration[7.0]
  def change
    create_join_table :abilities, :cards do |t|
      t.index [:ability_id, :card_id]
      t.index [:card_id, :ability_id]
    end
  end
end
