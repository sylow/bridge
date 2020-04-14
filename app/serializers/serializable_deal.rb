class SerializableDeal < JSONAPI::Serializable::Resource
  type 'deal'
  attributes :id

  has_one :west do
    data do
      @object.hands.find_by(seat: :w)
    end
  end

  has_many :hands do
    data do
      @object.hands
    end
  end
end