# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

technology   = Category.create(:title => "Technology",              :subtitle => nil)
business     = Category.create(:title => "Business",                :subtitle => nil)
comedy       = Category.create(:title => "Comedy",                  :subtitle => nil)
philosophy   = Category.create(:title => "Society & Culture",       :subtitle => "Philosophy")
christianity = Category.create(:title => "Religion & Spirituality", :subtitle => "Christianity")
spirituality = Category.create(:title => "Religion & Spirituality", :subtitle => "Spirituality")

Dir[File.join(Rails.root, 'db', 'seeds', 'christiantranshumanist', '*.rb')].sort.each { |seed| load seed }
Dir[File.join(Rails.root, 'db', 'seeds', 'startup', '*.rb')].sort.each { |seed| load seed }
Dir[File.join(Rails.root, 'db', 'seeds', 'christianity', '*.rb')].sort.each { |seed| load seed }
Dir[File.join(Rails.root, 'db', 'seeds', 'singularity', '*.rb')].sort.each { |seed| load seed }
Dir[File.join(Rails.root, 'db', 'seeds', 'abstraction', '*.rb')].sort.each { |seed| load seed }

p = Podcast.create(
  :title => "The Christian Transhumanist Podcast",
  :path => "christiantranshumanist",
  :body => "Micah Redding and Amy Gaskin explore Christianity and Transhumanism, diving deep into the relationship between religion, technology, and the future of the human race.",
  :author => "Micah Redding & Amy Gaskin",
  :keywords => "christianity,transhumanism,transhumanist,singularity,technology,theology",
  :categories => [christianity, philosophy, technology],
  :episodes => [@ct1, @ct2, @ct3, @ct4, @ct5, @ct6, @ct7, @ct8, @ct9, @ct10, @ct11],
  :email => "http://eepurl.com/bqluFf",
  :itunes => "https://itunes.apple.com/us/podcast/christian-transhumanist-podcast/id1053762042",
)
p.update_column(:image, "http://res.cloudinary.com/micahredding/image/upload/v1450932294/ds5vpgof4iw00mu357ng.jpg")

p = Podcast.create(
  :title => "Startup Sequence",
  :path => "startup",
  :body => "Demystifying tech decision-making! Two developers and a human being discuss the difficult world of technology, business, and building software that matters.",
  :author => "Micah Redding & Ann Howard",
  :keywords => "technology,startup,business,development",
  :categories => [technology, business],
  :episodes => [@s1, @s2, @s3],
  :email => "http://micahredding.us4.list-manage1.com/subscribe?u=c9e24ff2e309d9d4edb919a40&id=5d58b45aad",
  :itunes => "",
)
p.update_column(:image, "http://res.cloudinary.com/micahredding/image/upload/v1450933305/yhhxekdscyjwgjqkehpq.jpg")

p = Podcast.create(
  :title => "Christianity on the Curve",
  :path => "christianity",
  :body => "Demystifying tech decision-making! Two developers and a human being discuss the difficult world of technology, business, and building software that matters.",
  :author => "Micah Redding & Ryan Hogan",
  :keywords => "technology,startup,business,development",
  :categories => [technology, business],
  :episodes => [@c1, @c2],
  :email => "",
  :itunes => "http://itunes.apple.com/us/podcast/christianity-on-the-curve/id495669260",
)
p.update_column(:image, "http://res.cloudinary.com/micahredding/image/upload/v1450933340/abnehsblb1ykclxoetmq.jpg")

p = Podcast.create(
  :title => "The Podcast of Unnecessary Abstraction(s)",
  :path => "abstraction",
  :body => "An ascending rampage up the tower of abstraction(s). Obfuscation, paradox, and irony are the hallmarks of this pedantic exploration of intellectual pretension.",
  :author => "Micah Redding & Ryan Hogan",
  :keywords => "pedantic,irony,intellectual,pseudo,intellectual,Schrodinger,Epimenides,Paradox",
  :categories => [philosophy, comedy],
  :episodes => [@a1, @a2, @a3, @a4, @a5, @a6, @a7, @a8, @a9, @a10, @a11, @a12, @a13],
  :email => "",
  :itunes => "https://itunes.apple.com/us/podcast/brickcaster-abstraction/id572915904",
)
p.update_column(:image, "http://res.cloudinary.com/micahredding/image/upload/v1450933275/lyoagtsbyvho6qzvhzig.jpg")

p = Podcast.create(
  :title => "Broadcast From The Singularity",
  :path => "singularity",
  :body => "Micah, Ryan, John Yates, and friends discuss wild-eyed ideas about the future. With unique guests, they delve into life in the age of constantly accelerating change, and what that means for technology, culture, and the future of the world.",
  :author => "Micah Redding, Ryan Hogan & John Yates",
  :keywords => "singularity,technology,transhuman,transhumanism,kurzweil,artificial,intelligence,technium,kevin,kelly",
  :categories => [technology, philosophy],
  :episodes => [@bp1, @bp2, @bp3, @b1, @b2, @b3, @b4, @b5, @b6, @b7, @b8, @b9, @b10],
  :email => "",
  :itunes => "http://itunes.apple.com/us/podcast/broadcast-the-singularity/id495667410",
)
p.update_column(:image, "http://res.cloudinary.com/micahredding/image/upload/v1450933261/aaiu8a5e074tmetavedg.jpg")
