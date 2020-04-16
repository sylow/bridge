module Game::Contract
  class Create < Reform::Form
    include Dry

    property :user
    property :deal
    property :north
    property :south
    property :east
    property :west

    validation do
      required(:user)
      required(:deal)
      required(:north)
      required(:south)
      required(:east)
      required(:west)
    end
  end
end