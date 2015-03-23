# == Schema Information
#
# Table name: problems
#
#  id              :integer          not null, primary key
#  title           :string
#  description     :text
#  causes          :text
#  user_id         :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  comments_count  :integer          default("0")
#  solutions_count :integer          default("0")
#

class Problem < ActiveRecord::Base

  belongs_to :user

  has_many :solutions


  acts_as_commentable
  
 
  def og_title
    ERB::Util.h("#{title}")
  end
end
