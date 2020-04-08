class Deal::Create < Trailblazer::Operation
  step :save

  def save(ctx, params:, **)
    ctx[:model] = Deal.create(params)
  end
end