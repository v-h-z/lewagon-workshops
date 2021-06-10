# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Let's start, shall we?"
start = Time.now
puts "~~~~~~~~~~~"
puts "First, some workshops:"

{
  web: ['Landing Page', 'Figma', 'API', 'Javascript'],
  data: ['Data Analyse', 'Web Scraping', 'SQL', 'Machine Learning']
}.each do |key, names|
  workshops = names.map{|name| Workshop.create! name: name, specialty: key.to_s }
  puts workshops.map{|w| "-- #{w.name} created"}
end

puts "~~~~~~~~~~~"
puts "That's all folks!"
puts "It took me #{(Time.now-start).round(2)} seconds to execute my task (not to brag)"
puts "~~~~~~~~~~~"
