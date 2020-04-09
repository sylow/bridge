require 'rails_helper'

RSpec.describe Deal do
  let(:result) {Deal::Create.(params: {dealer: :n, zone: :all})}    

  context 'Deals' do
    it 'success' do
      expect(result[:model]).to be_persisted
    end
  end

  context 'Create Hands' do
    let(:deal) { result[:model]}
    it 'should succeed' do
      Deal::Deal.(params: {deal: deal})
      expect(deal.hands.count).to eq(4)
    end
  end

  context 'Deck' do
    let(:deal) { result[:model]}
    it 'should have 13 cards in each hand' do
      Deal::Deal.(params: {deal: deal})
      expect(deal.hands.first.cards.count).to eq(13)
    end
  end
end
