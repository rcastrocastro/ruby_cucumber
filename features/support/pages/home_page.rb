require_relative 'base_page'

class HomePage < BasePage
  attr_reader :btn_restaurante

  def initialize
    @btn_restaurante = EL['btn_restaurante']
  end

  def load
    visit '/'
  end

  def go_list_restaurants
    find(btn_restaurante).click
  end    

end    