class SerializableHand < JSONAPI::Serializable::Resource
  type 'hand'

  attributes :id, :spades, :hearts, :diamonds, :clubs


end