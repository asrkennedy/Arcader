class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :game_id
      t.integer :player1_id
      t.integer :player2_id
      t.integer :winner
      t.integer :loser

      t.timestamps
    end
  end
end
