class Deal::Create < Trailblazer::Operation
  step Model(Deal, :new)
  #step :validate
  step :save

  def validate(ctx, params:, **)
    ctx[:input] = Form.validate(params) # true/false
  end

  def save(ctx, params:, **)
    ctx[:model].save
  end
end