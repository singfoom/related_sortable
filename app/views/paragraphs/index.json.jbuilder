json.array!(@paragraphs) do |paragraph|
  json.extract! paragraph, :content, :order
  json.url paragraph_url(paragraph, format: :json)
end
