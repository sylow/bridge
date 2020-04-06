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
class DealSession < ApplicationRecord
  enum player: PlayerPosition.as_hash

  #associations
  belongs_to :deal
  belongs_to :north, class_name: 'User'
  belongs_to :south, class_name: 'User'
  belongs_to :east, class_name: 'User'
  belongs_to :west, class_name: 'User'
end
