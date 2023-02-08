class CreateResistances < ActiveRecord::Migration[7.0]
  def change
    create_table :resistances do |t|
      t.string :resistance_type
      t.string :value

      t.timestamps
    end
  end
end
