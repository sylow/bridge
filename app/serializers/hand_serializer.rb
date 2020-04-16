# == Schema Information
#
# Table name: hands
#
#  id      :bigint           not null, primary key
#  cards   :jsonb
#  seat    :enum
#  deal_id :bigint           not null
#
class HandSerializer < BaseSerializer
  attributes :id, :seat, :cards
end
