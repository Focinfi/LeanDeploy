json.array! @places do |place|
  json.extract! place, 
    :id, :name, :longitude, :latitude, 
    :category, :address, :contact,
    :business_hours, :description, :picture_01_url, 
    :picture_02_url, :picture_03_url
    
  json.created_at  place.created_at.to_date
  json.html_url place.html_url

end