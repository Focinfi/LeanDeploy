json.array! @places do |place|
  json.extract! place, 
    :id, :name, :longitude, :latitude, 
    :business_hours, :description
  json.created_at  place.created_at.to_date
  json.picture_url place.picture.url

end