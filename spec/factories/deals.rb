FactoryBot.define do
  factory :deal do
    dealer { "" }
    zone { "" }
    contract { "MyString" }
    result { 1 }
    score { "" }
    double { false }
  end
end
