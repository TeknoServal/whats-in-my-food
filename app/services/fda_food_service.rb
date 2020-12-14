class FDAFoodService
  def self.search_food(query)
    conn = create_connection(query)

    response = conn.get
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.create_connection(query = nil)
    Faraday.new('https://api.nal.usda.gov/fdc/v1/foods/search') do |req|
      req.params['api_key'] = ENV['FDA_API_KEY']
      req.params['query'] = query if query
      req.params['pageSize'] = 10
    end
  end
end
