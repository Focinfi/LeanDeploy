json.array!(@comments) do |comment|
  json.extract! comment, :id, :place_id, :content, :userId
  json.url comment_url(comment, format: :json)
end
