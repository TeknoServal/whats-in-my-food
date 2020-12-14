class FoodsController < ApplicationController
  def show
    @search = params[:q]
    @foods = FoodSearchFacade.search_food(@search)
  end
end
