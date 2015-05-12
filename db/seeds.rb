# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require "ffaker"
def category
  Place::CATEGORY_TYPES.fetch rand(5)
end
if Place.count > 0
  50.times do
    place = Place.create({ name: FFaker::Name.name,
                   latitude: "32.1119",
                   longitude: "118.932",
                   business_hours: "8:00-21:00",
                   description: FFaker::Lorem.sentence,
                   category: category,
                   address: "南京 仙林",
                   contact: '183-1234-4321'
                })
    HtmlDesc.create({ place_id: place.id, 
      html_doc: 
        "<h3>#{FFaker::Lorem.sentence}</h3>" +
        "<img src='http://7xiwsa.com2.z0.glb.qiniucdn.com/uploads%2Flibrary.png?e=1430997501&token=oDzI0sgiK40RaXTm_fne0yIgNvFZajLpwmmCSJe_:8vttC164BawEVd2hgPRd_8QYggE='>" +
        "<p>#{FFaker::Lorem.paragraph}</p>"
        })

    # Image.create({ place_id: place.id, url: "place_example.png"})
  end
end








