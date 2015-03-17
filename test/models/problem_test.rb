# == Schema Information
#
# Table name: problems
#
#  id             :integer          not null, primary key
#  title          :string
#  description    :text
#  causes         :text
#  user_id        :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  comments_count :integer          default("0")
#

require 'test_helper'

class ProblemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
