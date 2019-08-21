class CreateSearches < ActiveRecord::Migration[5.2]
  def change
    create_table :searches do |t|
      t.string :keyword
      t.string :genre
      t.string :platform
      t.integer :rating

      t.timestamps
    end
  end
end
