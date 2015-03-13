class Solution < ActiveRecord::Base

  belongs_to :problem


  validates :content, presence: true
end
