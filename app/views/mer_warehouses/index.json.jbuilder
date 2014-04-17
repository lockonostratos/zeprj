json.array!(@mer_warehouses) do |mer_warehouse|
  json.extract! mer_warehouse, :id, :branche_id, :name, :location
  json.url mer_warehouse_url(mer_warehouse, format: :json)
end
