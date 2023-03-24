class CreateWeaknesses < ActiveRecord::Migration[7.0]
  def change
    create_table :weaknesses do |t|
      t.string :weakness_type
      t.string :value

      t.timestamps
    end
  end
end
