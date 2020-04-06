# == Schema Information
#
# Table name: hands
#
#  id        :bigint           not null, primary key
#  clubs     :string           default([]), is an Array
#  diamonds  :string           default([]), is an Array
#  hearts    :string           default([]), is an Array
#  seat      :enum
#  spades    :string           default([]), is an Array
#  player_id :bigint           not null
#
class Hand < ApplicationRecord
  belongs_to :player
end
