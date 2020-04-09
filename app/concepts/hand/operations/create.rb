class Hand::Create < Trailblazer::Operation
  step :model!
  step :cards!
  step :save

  def model!(ctx, params:, **)
    ctx[:model] = Hand.new
  end

  def cards!(ctx, params:, **)
    ctx[:model].hearts = %w(A K Q J T 9 8 7 6 5 4 3 2)
  end

  def save(ctx, params:, **)
    ctx[:model].attributes = params
    ctx[:model].save
  end
end