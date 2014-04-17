json.array!(@mers) do |mer|
  json.extract! mer, :id, :head, :name
  json.url mer_url(mer, format: :json)
end
