class FoodSearchFacade
  def self.search_food(query)
    parsed_response = FDAFoodService.search_food(query)
    # require 'pry'; binding.pry
    foods = instantiate_foods(parsed_response[:foods])
    {
      result_count: parsed_response[:totalHits],
      foods: foods
    }
  end

  def self.instantiate_foods(foods)
    foods.map do |food|
      Food.new(food)
    end
  end
end
