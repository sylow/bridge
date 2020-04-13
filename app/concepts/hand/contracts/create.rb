module Hand::Contract
  class Create < Reform::Form
    include Dry

    property :deal
    property :seat

    validation do
      required(:deal)
      required(:seat)
    end
  end
end