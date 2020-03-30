class AddPlayerPositions < ActiveRecord::Migration[6.0]
  def up
    execute <<-SQL
      CREATE TYPE player_position AS ENUM ('n', 'e', 's', 'w');
    SQL
  end

  def down
    execute <<-SQL
      DROP TYPE player_position;
    SQL
  end
end
