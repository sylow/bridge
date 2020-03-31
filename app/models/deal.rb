# == Schema Information
#
# Table name: deals
#
#  id         :bigint           not null, primary key
#  contract   :string
#  result     :integer
#  score      :integer
#  double     :boolean
#  dealer     :enum
#  player     :enum
#  zone       :enum
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Deal < ApplicationRecord
  enum player: PlayerPosition.as_hash
end
