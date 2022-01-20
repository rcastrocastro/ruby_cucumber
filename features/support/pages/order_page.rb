require_relative 'base_page'

class OrderPage < BasePage
  attr_reader :order, :table_cart, :field_name, :field_email, :field_email_confirm, :field_address,
              :field_number, :field_optional_adress, :radio_payment, :msg_order

  def initialize
    @order = EL['order']
    @table_cart = EL['table_cart']
    @field_name = EL['field_name']
    @field_email = EL['field_email']
    @field_email_confirm = EL['field_email_confirm']
    @field_address = EL['field_address']
    @field_number = EL['field_number']
    @field_optional_adress = EL['field_optional_adress']
    @radio_payment = EL['radio_payment']
    @msg_order = EL['msg_order']
  end

  def total_iten
    find('td', text: 'R$ 27,10')
  end

  def frete
    find('tr', text: 'R$ 8,00')
  end

  def total
    find('td', text: 'R$ 35,10')
  end

  def shipping
    div = find(order, text: 'Frete e Total')
    div.all(table_cart)
  end

  def fill_user_data(user)
    find(field_name).set user[:nome]
    find(field_email).set user[:email]
    find(field_email_confirm).set user[:confirmacao_de_email]
    find(field_address).set user[:rua]
    find(field_number).set user[:numero]
    find(field_optional_adress).set user[:complemento]
  end

  def select_pay(type_payment)
    payopt = find(radio_payment)
    payopt.find('div', text: type_payment).find('div').click
  end

  def checkout(type_payment)
    select_pay(type_payment)
    click_button 'Finalizar Pedido'
  end

  def cat_msg
    find(msg_order)
  end

  def fill_user_faker
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    email = Faker::Internet.email.rpartition('@')[2]
    find(field_name).set "#{first_name} #{last_name}"
    find(field_email).set "#{first_name}_#{last_name}@#{email}" 
    find(field_email_confirm).set "#{first_name}_#{last_name}@#{email}" 
    find(field_address).set Faker::Address.street_name
    find(field_number).set Faker::Address.building_number
    find(field_optional_adress).set Faker::Address.secondary_address
  end 
end
