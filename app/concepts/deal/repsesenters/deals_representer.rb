require 'roar/json/json_api'

class DealsRepresenter < Roar::Decorator
  include Roar::JSON::JSONAPI.resource :deals

  attributes do 
    property :id
    property :dealer
    property :zone
  end

  has_many :hands, extend: HandsRepresenter
end