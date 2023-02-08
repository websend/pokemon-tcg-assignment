class CreateCardSeries < ActiveRecord::Migration[7.0]
  def change
    create_table :card_series do |t|
      t.string :unique_id
      t.string :name
      t.string :logo_url

      t.timestamps
    end

    add_index :card_series, :name
  end
end
