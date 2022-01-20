#language: pt

Funcionalidade: restaurantes
  Para que eu possa saber quais os restaurantes disponiveis com o tempo de entrega e nota de avaliacao
  Sendo um usuario que deseja fazer um pedido
  Possa acessar a lista de restaurantes

Cenario: Restaurantes disponiveis
  Dado que temos os seguintes restaurantes
    | nome           | categoria   | entrega    | avaliacao |
    | Bread & Bakery | Padaria     | 25 minutos | 4.9       |
    | Burger House   | Hamburgers  | 30 minutos | 3.5       |
    | Coffee Corner  | Cafeteria   | 20 minutos | 4.8       |
    | Green Food     | Saudável    | 40 minutos | 4.1       |
    | Ice Cream      | Sorvetes    | 1 hora     | 0         |
    | Tasty Treats   | Doces       | 20 minutos | 4.4       |
  Quando acesso a lista de restaurantes 
  Entao deve ver todos os restaurantes desta lista
