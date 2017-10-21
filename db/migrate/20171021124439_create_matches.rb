class CreateMatches < ActiveRecord::Migration[5.1]
  def change
    create_table :matches do |t|
      t.string :player_1
      t.string :player_2
      t.integer :score
      t.boolean :give_up
      t.boolean :wo

      t.timestamps
    end
  end
end
