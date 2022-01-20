require_relative '../base_page' 

class CartView < BasePage
  attr_reader :box_cart, :total_cart, :total_cart_text, :table_cart, :rmv_cart, :menu_produtos

  def initialize
    @box_cart = EL['box_cart']
    @total_cart = EL['total_cart']
    @total_cart_text = EL['total_cart_text']
    @table_cart = EL['table_cart']
    @rmv_cart = EL['rmv_cart']
    @menu_produtos = EL['menu_produtos']
  end

  def box
    find(box_cart)
  end

  def total_cart
    box.find('tr', text: 'Total:').find('td')
  end

  def remove_iten(item)
    box.all('table tbody tr')[item].find('.danger').click
  end

  def clean_cart
    click_button 'Limpar'
  end

  def close_cart
    click_link 'Fechar Pedido'
  end  
end  