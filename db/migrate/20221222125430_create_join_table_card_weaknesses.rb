class CreateJoinTableCardWeaknesses < ActiveRecord::Migration[7.0]
  def change
    create_join_table :cards, :weaknesses do |t|
      t.index [:card_id, :weakness_id]
      t.index [:weakness_id, :card_id]
    end
  end
end
