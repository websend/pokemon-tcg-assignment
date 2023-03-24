class CreateCardSets < ActiveRecord::Migration[7.0]
  def change
    create_table :card_sets do |t|
      t.string :unique_id
      t.references :card_serie, null: false, foreign_key: true
      t.string :name
      t.string :logo_url
      t.string :symbol_url
      t.date :release_date
      t.integer :first_edition_cards
      t.integer :holo_cards
      t.integer :normal_cards
      t.integer :official_cards
      t.integer :reverse_cards
      t.integer :total_cards

      t.timestamps
    end

    add_index :card_sets, :name
    add_index :card_sets, :release_date
  end
end
