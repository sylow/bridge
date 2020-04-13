class Deal::Create < Trailblazer::Operation
  step :model!
  step Contract::Build(constant: Deal::Contract::Create)
  step Contract::Validate()
  step Contract::Persist()

  def model!(ctx, params:, **)
    ctx[:model] = Deal.new
  end
end