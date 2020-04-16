class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.references :deal, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :north, null: false, foreign_key: { to_table: :users}
      t.references :south, null: false, foreign_key: { to_table: :users}
      t.references :west, null: false, foreign_key: { to_table: :users}
      t.references :east, null: false, foreign_key: { to_table: :users}
      t.string :contract
      t.integer :result, default: 0
      t.integer :score, default: 0

      t.timestamps
    end
  end
end
