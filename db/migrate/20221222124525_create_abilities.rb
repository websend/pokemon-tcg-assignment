class CreateAbilities < ActiveRecord::Migration[7.0]
  def change
    create_table :abilities do |t|
      t.string :name
      t.text :effect
      t.string :ability_type

      t.timestamps
    end

    add_index :abilities, :name
    add_index :abilities, :ability_type
  end
end
