class AddDealZone < ActiveRecord::Migration[6.0]
  def up
    execute <<-SQL
      CREATE TYPE deal_zone AS ENUM ('all', 'ns', 'ew', 'none');
    SQL
  end

  def down
    execute <<-SQL
      DROP TYPE deal_zone;
    SQL
  end

end
