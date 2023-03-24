class CreateCards < ActiveRecord::Migration[7.0]
  def change
    create_table :cards do |t|
      t.string :unique_id
      t.references :card_set, null: false, foreign_key: true
      t.string :category
      t.string :description
      t.integer :dex_id
      t.text :effect
      t.string :energy_type
      t.string :evolve_from
      t.float :hp
      t.string :illustrator
      t.string :image_url
      t.integer :level
      t.string :local_id
      t.string :name
      t.string :rarity
      t.string :regulation_mark
      t.integer :retreat
      t.string :stage
      t.string :suffix
      t.string :trainer_type
      t.boolean :first_edition
      t.boolean :holo
      t.boolean :normal
      t.boolean :reverse
      t.boolean :w_promo

      t.timestamps
    end

    add_index :cards, :name
    add_index :cards, :rarity
    add_index :cards, :stage
    add_index :cards, :trainer_type
  end
end
