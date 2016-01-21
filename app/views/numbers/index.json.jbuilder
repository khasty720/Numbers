json.array!(@numbers) do |number|
  json.extract! number, :id, :input
  json.url number_url(number, format: :json)
end
