# == Schema Information
#
# Table name: solutions
#
#  id             :integer          not null, primary key
#  content        :text
#  user_id        :integer
#  problem_id     :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  comments_count :integer          default("0")
#

require 'test_helper'

class SolutionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
