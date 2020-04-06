require 'rails_helper'

RSpec.describe Deal do
  context 'Deals' do
    it 'success' do
      result = Deal::Create.(params: {})
      expect(result[:model]).to be_persisted
    end
  end
end
