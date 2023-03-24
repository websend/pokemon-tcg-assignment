class CreateJoinTableCardPackTrainer < ActiveRecord::Migration[7.0]
  def change
    create_join_table :card_packs, :trainers do |t|
      t.index [:card_pack_id, :trainer_id]
      t.index [:trainer_id, :card_pack_id]
    end
  end
end
