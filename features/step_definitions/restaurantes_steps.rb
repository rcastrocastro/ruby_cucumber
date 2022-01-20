Dado('que temos os seguintes restaurantes') do |table|
  @restaurante_data = table.hashes
end
  
Quando('acesso a lista de restaurantes') do
  @page.call(HomePage).load
  @page.call(HomePage).go_list_restaurants
end
  
Entao('deve ver todos os restaurantes desta lista') do
  restaurantes = @page.call(RestaurantesListPage).list

  @restaurante_data.each_with_index do |value, index|
    expect(restaurantes[index]).to have_text value['nome'].upcase
    expect(restaurantes[index]).to have_text value['categoria']
    expect(restaurantes[index]).to have_text value['entrega']
    expect(restaurantes[index]).to have_text value['avaliacao']
  end    
end
