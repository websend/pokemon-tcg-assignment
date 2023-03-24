class CreateAttacks < ActiveRecord::Migration[7.0]
  def change
    create_table :attacks do |t|
      t.string :cost
      t.string :damage
      t.text :effect
      t.string :name

      t.timestamps
    end
  end
end
