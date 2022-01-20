Dado('que o usuario finalizou o pedido com os itens') do |table|
  steps %{
    Quando acesso a lista de restaurantes 
  }
  @page.call(RestaurantesListPage).go('Green Food')
  @produto_list = table.hashes
  steps %{
    Quando adiciono todos os itens
  }
  @page.call(CartView).close_cart
end

Quando('informar os dados de entrega') do |table|
  user = table.rows_hash
  @page.call(OrderPage).fill_user_data(user)
end

Quando('finalizar o pedido com o metodo de pagamento {string}') do |payment|
  @page.call(OrderPage).checkout(payment)
end

Então('será apresentada a mensagem:') do |expect_mesage|
  expect(@page.call(OrderPage).cat_msg).to have_content expect_mesage
end

Quando('informar os dados de entrega do usuario') do
  @page.call(OrderPage).fill_user_faker
end