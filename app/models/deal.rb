class Deal < ApplicationRecord
  enum player: PlayerPosition.as_hash
end
