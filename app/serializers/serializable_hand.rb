class SerializableHand < JSONAPI::Serializable::Resource
  type 'hand'

  attributes :id, :seat, :spades, :hearts, :diamonds, :clubs


end