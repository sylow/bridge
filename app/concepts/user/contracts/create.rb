module User::Contract
  class Create < Reform::Form
    include Dry
    property :username
    property :password

    validation do
      required(:username)
      required(:password)
    end
  end
end