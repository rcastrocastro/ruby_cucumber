Dado('que o produto desejado é {string}') do |produto|
  @produto_nome = produto
end

Dado('o valor do produto é {string}') do |preco|
  @produto_valor = preco
end

Quando('adiciono {int} unidade\(s)') do |quantidade|
  quantidade.times do
    @page.call(RestaurantePage).add_to_cart(@produto_nome)
  end
end

Entao('devera ser adicionado {int} unidade\(s) desse item') do |quantidade|
 expect(@page.call(CartView).box).to have_content "(#{quantidade}x) #{@produto_nome}"
end

Entao('o valor total deve ser de {string}') do |valor_total|
  expect(@page.call(CartView).total_cart.text).to eql valor_total
end

Dado('que os produtos desejado são') do |table|
  @produto_list = table.hashes
end

Quando('adiciono todos os itens') do
  @produto_list.each do |produto|
    produto['quantidade'].to_i.times do
       @page.call(RestaurantePage).add_to_cart(produto['nome'])
    end
  end
end

Dado('que os produtos adicionados são') do |table|
  @produto_list = table.hashes
  # DINAMIC STEPS REUTILIZAR STEPS QUE JA ESTAO PRONTOS
  steps %{
    Quando adiciono todos os itens 
  }
end


Entao('devera apresentar todos os itens no carrinho') do
  @produto_list.each do |p|
    expect(@page.call(CartView).box).to have_content "(#{p['quantidade']}x) #{p['nome']}"
  end
end

Quando('o usuario remove somente o item {int}') do |item|
    @page.call(CartView).remove_iten(item)
end

Entao('valor total deve ser de {string}') do |expect_total|
  expect(@page.call(CartView).total_cart.text).to eql expect_total
end

Quando('o usuario remove todos os itens') do
  # for each na lista de produto (produto_list) passando valor e index(itens na tabela) e ira pegar os itens pelo index o,1,2
  @produto_list.each_with_index do |value, index|
    @page.call(CartView).remove_iten(index) # remove todos os itens pelo index 0,1,2 o fro each comeca sempre em 0
  end
end

Entao('a seguinte mensagem sera apresentada {string}') do |mensagem|
  expect(@page.call(CartView).box).to have_content mensagem # buscando dentro de um elemento especifico, pq o elemento esta mapeado dentro deste metodo
  expect(page).to have_content mensagem # buscando na pagina inteira a mensagem
end

Quando('o usuario limpa o carrinho') do
  @page.call(CartView).clean_cart
end

Quando('o adiciona itens ao carrinho') do
  @page.call(CartView).close_cart
end

Entao('o valor total dos itens deverá ser {string}') do |iten_cart|
  #expect(@page.call(OrderPage).total_iten).to have_content iten_cart
  expect(@page.call(OrderPage).shipping[0]).to have_content iten_cart 
end

Entao('o valor do frete deve ser igual a {string}') do |frete|
  #expect(@page.call(OrderPage).frete).to have_content frete
  expect(@page.call(OrderPage).shipping[1]).to have_content frete
end

Entao('o valor do carrinho deve ser igual a {string}') do |total|
  #expect(@page.call(OrderPage).total).to have_content total
  expect(@page.call(OrderPage).shipping[2]).to have_content total
end
