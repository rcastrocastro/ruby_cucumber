#language: pt

Funcionalidade: Cardapio
  Para que o usuario consiga escolher o que deseja comer
  Sendo que escolheu o restaurantes
  Possa acessar o Cardapio

  Contexto: Restaurantes
    Dado que o usuario acesse a lista de restaurantes

@prod
  Cenario: Produto
    Quando escolho o restaurante 'Burger House'
    Então os itens do cardapio serao apresentados 
      | produto        | descricao                       | preco    |
      | Classic Burger | O clássico. Não tem como errar. | R$ 18,50 |
      | Batatas Fritas | Batatas fritas crocantes        | R$ 5,50  |
      | Refrigerante   | O refri mais gelado da cidade.  | R$ 4,50  |
