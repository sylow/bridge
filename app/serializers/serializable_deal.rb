class SerializableDeal < JSONAPI::Serializable::Resource
  type 'deal'
  attributes :id, :zone, :dealer, :hands
end