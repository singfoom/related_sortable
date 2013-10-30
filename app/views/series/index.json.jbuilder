json.array!(@series) do |series|
  json.extract! series, :name
  json.url series_url(series, format: :json)
end
