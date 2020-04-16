# == Schema Information
#
# Table name: games
#
#  id         :bigint           not null, primary key
#  contract   :string
#  result     :integer          default(0)
#  score      :integer          default(0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  deal_id    :bigint
#  east_id    :bigint           not null
#  north_id   :bigint           not null
#  south_id   :bigint           not null
#  user_id    :bigint           not null
#  west_id    :bigint           not null
#
class Game < ApplicationRecord
  belongs_to :deal
  belongs_to :user
  belongs_to :north, class_name: 'User'
  belongs_to :south, class_name: 'User'
  belongs_to :west, class_name: 'User'
  belongs_to :east, class_name: 'User'
end
