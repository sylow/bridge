class Deal::Create < Trailblazer::Operation
  step :create_model!
  step Contract::Build(constant: Deal::Contract::Create)
  step Contract::Validate()
  step Contract::Persist()

  def create_model!(ctx, params:, **)
    ctx[:model] = Deal.new
  end
end