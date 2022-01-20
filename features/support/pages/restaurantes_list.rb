require_relative 'base_page'

class RestaurantesListPage < BasePage
  attr_reader :menu_restaurants

  def initialize
    @menu_restaurants = EL['menu_restaurants']
  end

  def list
    all(menu_restaurants)
  end

  def go(restaurante)
    find(menu_restaurants, text: restaurante.upcase).click
  end
end
