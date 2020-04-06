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
class Deal < ApplicationRecord
  enum player: PlayerPosition.as_hash

  #associations
  has_many :deal_sessions, dependent: :destroy
end
