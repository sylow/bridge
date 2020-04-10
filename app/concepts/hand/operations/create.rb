class Hand::Create < Trailblazer::Operation
  step :model!
  step :cards!
  step :save

  def model!(ctx, params:, **)
    ctx[:model] = Hand.new
  end

  def cards!(ctx, params:, deck:, **)
    1.upto(13) do 
      ctx[:model].add_card(deck.pick)
    end
  end

  def save(ctx, params:, **)
    ctx[:model].attributes = params
    ctx[:model].save
  end
end 