require 'roar/json/json_api'

class HandsRepresenter < Roar::Decorator
  include Roar::JSON::JSONAPI.resource :hands

  attributes do
    property :id
    property :seat
    property :spades
    property :hearts
    property :diamonds
    property :clubs
  end
end