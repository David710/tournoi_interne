class AddGroupReferenceToPlayers < ActiveRecord::Migration[5.1]
  def change
    add_reference :players, :group, foreign_key: true
  end
end
