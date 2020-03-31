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
require 'rails_helper'

RSpec.describe Deal, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
