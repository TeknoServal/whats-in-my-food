describe 'As a user,' do
  describe 'When I visit "/" And I fill in the search form with "sweet potatoes"' do
    it 'And I click "Search"' do
      visit '/'

      fill_in(:q, with: 'apple')

      expect(page).to have_current_path('/foods')

      expect(page).to have_content('39244 results')

      expect(page).to have_css('.food-block', count: 10)

      # And for each of the foods I should see:
      page.all('.food-block').each do |food_block|
        # - The food's GTIN/UPC code
        expect(food_block).to have_css('.food-code')
        # - The food's description
        expect(food_block).to have_css('.food-description')
        # - The food's Brand Owner
        expect(food_block).to have_css('.food-brand')
        # - The food's ingredients
        expect(food_block).to have_css('.food-ingredients')

      end
    end
  end
end
