class FDAFoodService
  def self.search_food(query)
    conn = create_connection(query)

    response = conn.get
    JSON.parse(response.body)
  end

  def self.create_connection(query = nil, append = nil)
    Faraday.new("https://api.nal.usda.gov/fdc/v1/foods/search") do |req|
      req.params['api_key'] = ENV['TMDB_API_KEY']
      req.params['query'] = query if query
      req.params['append_to_response'] = append if append
    end
  end
end
