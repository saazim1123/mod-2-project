class CreateSearches < ActiveRecord::Migration[5.2]
  def change
    create_table :searches do |t|
      t.string :keyword
      t.integer :game_id
      t.integer :genre_id
      t.integer :platform_id

      t.timestamps
    end
  end
end
