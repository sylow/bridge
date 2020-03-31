class Deal::Create < Trailblazer::Operation
  step Model(Deal, :new)
end