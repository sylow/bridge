class User::Create < Trailblazer::Operation
  step :model!
  step Contract::Build(constant: User::Contract::Create)
  step Contract::Validate()
  step Contract::Persist()
  step :payload!

  def model!(ctx, params:, **)
    ctx[:model] = User.new
  end

  def payload!(ctx, params:, **)
    payload = { user_id: ctx[:model].id }
    ctx[:jwt] = JWT.encode(payload, ENV['SECRET_KEY'])
  end
end