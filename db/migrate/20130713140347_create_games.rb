class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name
      t.text :description
      t.text :instructions
      t.string :game_image

      t.timestamps
    end
  end
end
