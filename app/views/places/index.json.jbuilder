json.array!(@places) do |place|
  json.extract! place, :id, :name, :description, :imgUrl, :longtitude, :latitude, :intro, :html, :author
  json.url place_url(place, format: :json)
end
