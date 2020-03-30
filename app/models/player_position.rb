class PlayerPosition
  POSITIONS = %w(n e s w).freeze

  def self.as_hash
    Hash[self::POSITIONS.map { |el| [el, el] }]
  end
end