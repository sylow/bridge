# == Schema Information
#
# Table name: deal_sessions
#
#  id         :bigint           not null, primary key
#  contract   :string
#  player     :enum
#  result     :integer
#  score      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  deal_id    :bigint
#  east_id    :bigint
#  north_id   :bigint
#  south_id   :bigint
#  west_id    :bigint
#
FactoryBot.define do
  factory :deal_session do
    north { "MyString" }
    south { "MyString" }
    east { "MyString" }
    west { "MyString" }
    contract { "MyString" }
    double { false }
    result { "MyString" }
    score { "MyString" }
    player { "MyString" }
  end
end
