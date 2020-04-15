class Deal::Find < Trailblazer::Operation
  step :find

  def find(ctx, params:, **)
    ctx[:model] = params[:deal]
  end
end