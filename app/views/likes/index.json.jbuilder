json.array!(@likes) do |like|
  json.extract! like, :id, :place_id, :userId
  json.url like_url(like, format: :json)
end
