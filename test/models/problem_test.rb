# == Schema Information
#
# Table name: problems
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  causes      :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class ProblemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
