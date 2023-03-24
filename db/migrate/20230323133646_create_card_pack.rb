class CreateCardPack < ActiveRecord::Migration[7.0]
  def change
    create_table :card_packs do |t|
      t.string :name
      t.string :description
      t.integer :coins

      t.timestamps
    end
  end
end
