#language: pt
@greenfood
Funcionalidade: Finalizar pedido
  Para que o usuario receba o seu pedido no seu endereco
  Sendo o usuario que fechou o carrinho com os itens
  Possa finalizar o seu pedido

Contexto: adicionar itens ao carrinho
  Dado que o usuario finalizou o pedido com os itens
    | quantidade | nome                | descricao                                | valor    |
    | 1          | Suco Detox          | Suco de couve, cenoura, salsinha e maçã. | R$ 14,90 |
    | 2          | Hamburger de Quinoa | Cheio de fibras e muito saboroso.        | R$ 21,00 |

Cenario: Finalizar pedido com ticket
  Quando informar os dados de entrega
    | nome                  | beatriz chagas brunhani |
    | email                 | biachbr@gmail.com       |
    | confirmacao_de_email  | biachbr@gmail.com       |
    | rua                   | estrada velha da penha  |
    | numero                | 88                      |
    | complemento           | apto 63                 |
  E finalizar o pedido com o metodo de pagamento 'Cartão Refeição'
  Então será apresentada a mensagem:
  """
  Seu pedido foi recebido pelo restaurante. Prepare a mesa que a comida está chegando!
  """
@fisnish
  Cenario: Finalizar pedido com ticket
  Quando informar os dados de entrega do usuario
  E finalizar o pedido com o metodo de pagamento 'Dinheiro'
  Então será apresentada a mensagem:
  """
  Seu pedido foi recebido pelo restaurante. Prepare a mesa que a comida está chegando!
  """




