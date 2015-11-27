json.array!(@handles) do |handle|
  json.extract! handle, :id, :handle_name
  json.url handle_url(handle, format: :json)
end
