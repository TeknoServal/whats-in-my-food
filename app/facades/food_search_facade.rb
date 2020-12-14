class FoodSearchFacade
  def self.search_food(query)
    parsed_response = FDAFoodService.search_food(query)
    foods = instantiate_foods(parsed_response[:foods])
    [parsed_response[:totalHits, foods]]
  end

  def self.instantiate_foods(foods)

  end
end
