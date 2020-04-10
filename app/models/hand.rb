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
    {spades: spades, hearts: hearts, diamonds: diamonds, clubs: clubs}
  end

  def add_card(card)
    public_send(card[:type].to_s) << card[:value]
  end
end
