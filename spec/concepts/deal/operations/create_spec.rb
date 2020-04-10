require 'rails_helper'

RSpec.describe Deal do
  let(:result) {Deal::Create.(params: {dealer: :n, zone: :all})}    

  context 'Deal' do
    it 'should save' do
      expect(result[:model]).to be_persisted
    end
  end

  context 'Create Hands' do
    let(:deal) { result[:model]}
    it 'should create' do
      Deal::Deal.(params: {deal: deal})
      expect(deal.hands.count).to eq(4)
    end
  end

  context 'Hand' do
    let(:deal) { result[:model]}
    
    before(:each) do
      Deal::Deal.(params: {deal: deal})
    end

    it 'should have 13 cards in each hand' do
      deal.hands.each do |hand|
        expect(hand.cards.values.flatten.count).to eq(13)
      end
    end

    it 'should have 13 spades,... in total in 4 hands' do
      cards = {spades: [], hearts: [], diamonds: [], clubs: []}
      deal.hands.each do |hand|
        cards.keys.each do |key|
          cards[key] |= hand.cards[key]
        end
      end
      cards.keys.each do |key|
        expect(cards[key].count).to eq(13)
        expect(cards[key]).to match_array(Deck::VALUES) 
      end
    end    

    it 'should have 13 cards in 4 seats' do
      north = deal.hands.find_by seat: :n
      south = deal.hands.find_by seat: :s
      west = deal.hands.find_by seat: :w
      east = deal.hands.find_by seat: :e
    end    
  end
end
