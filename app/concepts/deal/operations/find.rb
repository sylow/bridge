class Deal::Find < Trailblazer::Operation
  step :find

  def find(ctx, params:, **)
    ctx[:model] = Deal.find_by id: params[:id]
  end
end