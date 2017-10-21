class CreatePlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :players do |t|
      t.string :first_name
      t.string :last_name
      t.string :ranking
      t.integer :win
      t.integer :lost
      t.integer :points

      t.timestamps
    end
  end
end
