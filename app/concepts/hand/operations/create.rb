class Hand::Create < Trailblazer::Operation
  step :create_model!
  step :cards!
  step :sort!
  step :save

  def create_model!(ctx, params:, **)
    ctx[:model] = Hand.new
  end

  def cards!(ctx, params:, deck:, **)
    1.upto(13) do 
      ctx[:model].cards << deck.pick
    end
  end

  def sort!(ctx, params:, deck:, **)
    ctx[:model].cards = ctx[:model].cards.sort_by{|a| ::Deck::VALUES.index(a[:value])}
  end

  def save(ctx, params:, **)
    ctx[:model].attributes = params
    ctx[:model].save
  end
end 