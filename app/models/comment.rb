# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  title            :string(50)       default("")
#  content          :text
#  commentable_id   :integer
#  commentable_type :string
#  user_id          :integer
#  role             :string           default("comments")
#  created_at       :datetime
#  updated_at       :datetime
#  agree_level      :integer
#
# Indexes
#
#  index_comments_on_commentable_id    (commentable_id)
#  index_comments_on_commentable_type  (commentable_type)
#  index_comments_on_user_id           (user_id)
#

class Comment < ActiveRecord::Base

  include ActsAsCommentable::Comment

  belongs_to :commentable, :polymorphic => true, :counter_cache => true

  validates :content, presence: true

  default_scope -> { order('created_at ASC') }

   enum agree_level: { "agree" => 0,                       "object"           => 1,                       "against"   => 2,                      }



  # NOTE: install the acts_as_votable plugin if you
  # want user to vote on the quality of comments.
  #acts_as_voteable

  # NOTE: Comments belong to a user
  belongs_to :user



end
