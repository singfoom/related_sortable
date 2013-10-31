json.array!(@chapters) do |chapter|
  json.extract! chapter, :title
  json.url chapter_url(chapter, format: :json)
end
