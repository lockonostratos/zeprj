json.array!(@warehouses) do |warehouse|
  json.extract! warehouse, :id, :branch_id, :name
  json.url warehouse_url(warehouse, format: :json)
end
