json.array!(@searches) do |search|
  json.extract! search, :id, :image_path, :date_lost, :num_results, :email, :finished
  json.url search_url(search, format: :json)
end
