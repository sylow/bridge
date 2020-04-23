class AddStateToGames < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :state, :string
  end
end
