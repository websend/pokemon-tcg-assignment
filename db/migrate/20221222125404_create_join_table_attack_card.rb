class CreateJoinTableAttackCard < ActiveRecord::Migration[7.0]
  def change
    create_join_table :attacks, :cards do |t|
      t.index [:attack_id, :card_id]
      t.index [:card_id, :attack_id]
    end
  end
end
