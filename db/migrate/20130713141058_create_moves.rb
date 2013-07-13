class CreateMoves < ActiveRecord::Migration
  def change
    create_table :moves do |t|
      t.integer :move_number
      t.integer :move_square
      t.string :move_type
      t.integer :match_id
      t.integer :player_id

      t.timestamps
    end
  end
end
