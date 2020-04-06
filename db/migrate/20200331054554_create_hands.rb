class CreateHands < ActiveRecord::Migration[6.0]
  def change
    create_table :hands do |t|
      t.column :seat, :player_position
      t.string :spades, array: true, default: []
      t.string :hearts, array: true, default: []
      t.string :diamonds, array: true, default: []
      t.string :clubs, array: true, default: []
      t.references :player, null: false, foreign_key: {to_table: :users}

    end
  end
end
