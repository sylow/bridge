class Deal::Deal < Trailblazer::Operation
  step :deal

  def deal(ctx, params:, **)
    4.times { params[:deal].hands.create }
  end
end