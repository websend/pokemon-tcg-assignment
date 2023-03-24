class CreateJoinTableCardTrainer < ActiveRecord::Migration[7.0]
  def change
    create_join_table :cards, :trainers do |t|
      t.index [:card_id, :trainer_id]
      t.index [:trainer_id, :card_id]
    end
  end
end
