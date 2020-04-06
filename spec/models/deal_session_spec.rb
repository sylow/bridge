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
require 'rails_helper'

RSpec.describe DealSession, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
