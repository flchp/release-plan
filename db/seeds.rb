# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

account = User.new(:email => "user@releaseplan.io", :name => "Super PM", :password => "12345678",
  :password_confirmation => "12345678")

account.save!

puts account.id