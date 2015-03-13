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

class Problem < ActiveRecord::Base

  belongs_to :user

  has_many :solutions
end
