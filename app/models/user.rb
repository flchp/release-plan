# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  name                   :string
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime
#  updated_at             :datetime
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  has_many :problems         

  def self.find_or_create_for_google_oauth2(access_token, signed_in_resource=nil)
    data = access_token.info

    if user = User.where(:email => data["email"]).first
      user
    else

      new_user = User.new
      new_user.name = data["name"] 
      new_user.name.gsub!(/[^\w]/, "_")

      new_user.email = data["email"]
      new_user.password = Devise.friendly_token[0,20]

      new_user.save!
      new_user
    end
  end
  

  def company
    ""
  end
end
