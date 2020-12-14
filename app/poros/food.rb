class Food
  attr_reader :nutrients
  def initialize(data)
    data.except(:foodNutrients).each do |key, value|
      instance_variable_set("@#{key}", value)
      self.class.send(:attr_reader, key)
    end

    @nutrients = data[:foodNutrients].map do |nutrient|
      Nutrient.new(nutrient)
    end

  end
end
