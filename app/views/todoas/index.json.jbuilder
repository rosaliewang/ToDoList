json.array!(@todoas) do |todoa|
  json.extract! todoa, :id, :content, :due
  json.url todoa_url(todoa, format: :json)
end
