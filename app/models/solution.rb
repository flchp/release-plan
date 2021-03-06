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
#  title          :string
#

class Solution < ActiveRecord::Base

  belongs_to :problem, :counter_cache => true
  belongs_to :user

  validates :content, presence: true

  acts_as_commentable


  scope :recent , -> { order("id ASC")}
end
