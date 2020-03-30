class CreateDeals < ActiveRecord::Migration[6.0]
  def change
    create_table :deals do |t|
      t.string :contract
      t.integer :result
      t.integer :score
      t.boolean :double, deault: false

      t.timestamps
    end

    add_column :deals, :dealer, :player_position
    add_column :deals, :player, :player_position
    add_column :deals, :zone, :deal_zone
  end
end
