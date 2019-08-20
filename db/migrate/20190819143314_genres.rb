class Genres < ActiveRecord::Migration[5.2]
  def change
    create_table :genres do |t|
      t.integer :game_id
      t.string :name
    end
  end
end
