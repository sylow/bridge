module Deal::Contract
  class Create < Reform::Form
    include Dry

    property :dealer
    property :zone

    validation do
      required(:dealer)
      required(:zone)
    end
  end
end