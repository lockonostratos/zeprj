json.array!(@metro_summaries) do |metro_summary|
  json.extract! metro_summary, :id, :warehouse_id, :product_count, :stock_count, :customer_count, :staff_count, :sale_count, :sale_count_day, :sale_count_month, :return_count, :return_count_day, :return_count_month, :revenue, :revenue_day, :revenue_month
  json.url metro_summary_url(metro_summary, format: :json)
end
