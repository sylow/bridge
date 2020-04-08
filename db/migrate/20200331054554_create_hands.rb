class CreateHands < ActiveRecord::Migration[6.0]
  def change
    create_table :hands do |t|
      t.references :deal, null: false      
      t.column :seat, :player_position
      t.string :spades, array: true, default: []
      t.string :hearts, array: true, default: []
      t.string :diamonds, array: true, default: []
      t.string :clubs, array: true, default: []
    end
  end
end
