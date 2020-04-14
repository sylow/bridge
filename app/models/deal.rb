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
  enum dealer: PlayerPosition.as_hash
  enum zone: DealZone.as_hash, _prefix: :zone

  #validations
  validates :dealer, presence: true
  validates :zone, presence: true

  #associations
  has_many :hands, dependent: :destroy
  has_many :deal_sessions, dependent: :destroy
  has_one :west, -> {hands.where(seat: :w)}, class_name: 'Hand'
end
