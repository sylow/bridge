# == Schema Information
#
# Table name: deals
#
#  id         :bigint           not null, primary key
#  dealer     :enum
#  zone       :enum
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
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
