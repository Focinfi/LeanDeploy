# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require "ffaker"
# Table name: places
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  latitude       :float(24)
#  longitude      :float(24)
#  business_hours :string(255)
#  description    :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  picture        :string(255)
# book = Book.create({name: "C programming", author: "Mr. Zhang", isbn: "2319821983"})
# book = Book.create({name: "D programming", author: "Mr. Zhang", isbn: "2332121983"})
50.times do
  place = Place.create({ name: FFaker::Name.name,
                 latitude: "32.1119",
                 longitude: "118.932",
                 business_hours: "8:00-21:00",
                 description: FFaker::Lorem.sentence,
                 picture: nil
              })
  HtmlDesc.create({ place_id: place.id, html_doc: "<p>#{FFaker::Lorem.paragraphs(2).join}</p>" })
  Image.create({ place_id: place.id, url: "place_example.png"})  
end









