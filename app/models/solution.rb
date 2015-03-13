class Solution < ActiveRecord::Base

  belongs_to :problem
  belongs_to :user

  validates :content, presence: true
end
