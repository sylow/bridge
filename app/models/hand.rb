# == Schema Information
#
# Table name: hands
#
#  id       :bigint           not null, primary key
#  clubs    :string           default([]), is an Array
#  diamonds :string           default([]), is an Array
#  hearts   :string           default([]), is an Array
#  seat     :enum
#  spades   :string           default([]), is an Array
#  deal_id  :bigint           not null
#
class Hand < ApplicationRecord
  enum seat: PlayerPosition.as_hash

  #associations
  belongs_to :deal

  def cards
    clubs + diamonds + hearts + spades
  end
end
