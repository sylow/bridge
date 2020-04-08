class Deck
  attr_reader :cards

  def initialize
    @cards = []
    %w(S H D C).each do |type|
      %w(A K Q J T 9 8 7 6 5 4 3 2).each do |card|
        @cards << "#{type}#{card}"
      end
    end
  end
end