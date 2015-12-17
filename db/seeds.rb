# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

Podcast.create(:title => "The Christian Transhumanist Podcast",       :path => "christiantranshumanist", :body =>"", :author => "", :keywords => "")
Podcast.create(:title => "Startup Sequence",                          :path => "startup",                :body =>"", :author => "", :keywords => "")
Podcast.create(:title => "The Podcast of Unnecessary Abstraction(s)", :path => "abstraction",            :body =>"", :author => "", :keywords => "")
Podcast.create(:title => "Broadcast From The Singularity",            :path => "singularity",            :body =>"", :author => "", :keywords => "")
