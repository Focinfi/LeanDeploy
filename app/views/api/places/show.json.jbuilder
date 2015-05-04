json.extract! @place, 
  :id, :name, :author, :longitude, :latitude, 
  :business_hours, :description, :view_times
json.created_at  @place.created_at.to_date
json.picture_url @place.picture.url
json.html_url @place.html_url