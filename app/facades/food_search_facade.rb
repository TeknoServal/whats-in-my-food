class FoodSearchFacade
  def self.search_food(query)
    Rails.cache.fetch("food_query/#{query}", expires_in: 7.days) do
      parsed_response = FDAFoodService.search_food(query)
      # require 'pry'; binding.pry
      foods = instantiate_foods(parsed_response[:foods])
      {
        result_count: parsed_response[:totalHits],
        foods: foods
      }
    end
  end

  def self.instantiate_foods(foods)
    foods.map do |food|
      Food.new(food)
    end
  end
end
