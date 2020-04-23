# == Schema Information
#
# Table name: games
#
#  id         :bigint           not null, primary key
#  contract   :string
#  result     :integer          default(0)
#  score      :integer          default(0)
#  state      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  deal_id    :bigint
#  east_id    :bigint           not null
#  north_id   :bigint           not null
#  south_id   :bigint           not null
#  user_id    :bigint           not null
#  west_id    :bigint           not null
#
require 'rails_helper'

RSpec.describe Game, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
