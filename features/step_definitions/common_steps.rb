Dado('que o usuario acesse a lista de restaurantes') do
  #dinamic steps reutiliza o codigo
  steps %{
    Quando acesso a lista de restaurantes 
  }
end

Quando('escolho o restaurante {string}') do |restaurante|
  @page.call(RestaurantesListPage).go(restaurante)
end
