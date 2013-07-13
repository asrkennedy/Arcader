class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :gender
      t.string :user_image
      t.string :username
      t.string :password_digest
      t.text :bio

      t.timestamps
    end
  end
end
