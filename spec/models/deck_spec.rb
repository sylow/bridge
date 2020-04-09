require 'rails_helper'

RSpec.describe Deck, type: :model do
  context 'Cards' do
    let(:deck){ Deck.new}
    it '52' do
      expect(deck.cards.count).to eq 52
    end
  end
end