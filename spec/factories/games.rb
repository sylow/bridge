# == Schema Information
#
# Table name: games
#
#  id         :bigint           not null, primary key
#  contract   :string
#  result     :integer          default(0)
#  score      :integer          default(0)
#  state      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  deal_id    :bigint
#  east_id    :bigint           not null
#  north_id   :bigint           not null
#  south_id   :bigint           not null
#  user_id    :bigint           not null
#  west_id    :bigint           not null
#
FactoryBot.define do
  factory :game do
    north { nil }
    south { nil }
    west { nil }
    east { nil }
    contract { "MyString" }
    result { 1 }
    score { 1 }
  end
end
