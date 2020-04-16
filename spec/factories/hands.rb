# == Schema Information
#
# Table name: hands
#
#  id      :bigint           not null, primary key
#  cards   :jsonb
#  seat    :enum
#  deal_id :bigint           not null
#
FactoryBot.define do
  factory :hand do
    seat { "" }
    spades { "MyString" }
    hearts { "MyString" }
    diamonds { "MyString" }
    clubs { "MyString" }
    player { nil }
  end
end
