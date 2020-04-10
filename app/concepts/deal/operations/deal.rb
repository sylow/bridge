class Deal::Deal < Trailblazer::Operation
  step :find
  step :deal

  def find(ctx, params:, **)
    ctx[:model] = params[:deal]
  end

  def deal(ctx, params:, **)
    deck = Deck.new
    PlayerPosition::POSITIONS.each do |seat|
      Hand::Create.(params: {seat: seat, deal: ctx[:model]}, deck: deck)
    end 
  end
end