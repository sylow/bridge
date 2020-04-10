class Deck
  attr_reader :cards
  TYPES  = %w(spades hearts diamonds clubs).freeze
  VALUES = %w(A K Q J T 9 8 7 6 5 4 3 2).freeze

  def initialize
    @cards = []
    TYPES.each do |type|
      VALUES.each do |card|
        @cards << { type: type, value: card }
      end
    end
  end

  def pick
    @cards.delete_at(rand(@cards.length))
  end
end