class CreateJoinTableCardResistance < ActiveRecord::Migration[7.0]
  def change
    create_join_table :cards, :resistances do |t|
      t.index [:card_id, :resistance_id]
      t.index [:resistance_id, :card_id]
    end
  end
end
