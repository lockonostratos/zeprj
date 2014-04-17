json.array!(@mer_skulls) do |mer_skull|
  json.extract! mer_skull, :id, :mer_id, :skull_code, :description
  json.url mer_skull_url(mer_skull, format: :json)
end
