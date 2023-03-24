class AddCoinsToTrainer < ActiveRecord::Migration[7.0]
  def change
    add_column :trainers, :coins, :integer, default: 0
  end
end
