class Game::Create < Trailblazer::Operation
  step :create_model!
  step :deal!
  step Contract::Build(constant: Game::Contract::Create)
  step Contract::Validate()
  step Contract::Persist()
  step :state!

  def create_model!(ctx, params:, **)
    ctx[:model] = Game.new
  end

  def deal!(ctx, params:, **)
    deal = Deal::Create.({ params: {dealer: PlayerPosition::POSITIONS.sample,  zone: DealZone::ZONES.sample} })[:model]
    Deal::Deal.({ params: {deal: deal}})
    ctx[:model].deal = deal
  end

  def state!(ctx, params:, **)
    ctx[:model].bid!
  end
end