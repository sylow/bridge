class CreateDealSessions < ActiveRecord::Migration[6.0]
  def change
    create_table :deal_sessions do |t|
      t.references :deal
      t.references :north, foreign_key: { to_table: :users}      
      t.references :south, foreign_key: { to_table: :users}      
      t.references :east,  foreign_key: { to_table: :users}      
      t.references :west,  foreign_key: { to_table: :users}      
      t.string :contract
      t.integer :result
      t.integer :score
      t.column :player, :player_position

      t.timestamps
    end
  end
end
