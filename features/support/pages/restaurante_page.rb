require_relative 'base_page'

class RestaurantePage < BasePage
  attr_reader :menu_produtos, :detail_rest, :cart

  def initialize
    @menu_produtos = EL['menu_produtos']
    @detail_rest = EL['detail_rest']
    @cart = EL['cart']
  end

  def menu
    all(menu_produtos)
  end

  def details
    find(detail_rest)
  end

  def add_to_cart(item)
    find(menu_produtos, text: item.upcase).find(cart).click
  end
end
