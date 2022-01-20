#language: pt

Funcionalidade: Carrinho
  Para que o usuario consiga finalizar uma compra
  Sendo que ja decidiu o que deseja comer
  Possa adicionar o item ao carrinho

# tudo que está no contexto é realizado em todos os cenarios sempre ao rodar
  Contexto: Restaurantes
    Dado que o usuario acesse a lista de restaurantes
    E escolho o restaurante 'Bread & Bakery'

  Cenario: Adicionar um item ao carrinho
    Dado que o produto desejado é 'Cup Cake'
    E o valor do produto é 'R$ 8,70'
    Quando adiciono 1 unidade(s) 
    Entao devera ser adicionado 1 unidade(s) desse item
    E o valor total deve ser de 'R$ 8,70'

  Cenario: Adicionar dois itens ao carrinho
    Dado que o produto desejado é 'Donut'
    E o valor do produto é 'R$ 2,50'
    Quando adiciono 2 unidade(s) 
    Entao devera ser adicionado 2 unidade(s) desse item
    E o valor total deve ser de 'R$ 5,00'

  @cart
  Cenario: Adicionar varios itens ao carrinho
    Dado que os produtos desejado são
      | nome                   | preco    | quantidade |
      | Cup Cake               | R$ 8,70  | 1          |
      | Donut                  | R$ 2,50  | 2          |
      | Pão Artesanal Italiano | R$ 15,90 | 1          |
    Quando adiciono todos os itens 
    Entao devera apresentar todos os itens no carrinho 
    E o valor total deve ser de 'R$ 29,60'

@total
  Esquema do Cenario: Remover iten do carrinho
    Dado que os produtos adicionados são
      | nome                   | preco    | quantidade |
      | Cup Cake               | R$ 8,70  | 1          |
      | Donut                  | R$ 2,50  | 1          |
      | Pão Artesanal Italiano | R$ 15,90 | 1          |
    Quando o usuario remove somente o item <item>
    Entao  valor total deve ser de <total>

      Exemplos: 
        | item | total      |
        | 0    | 'R$ 18,40' |
        | 1    | 'R$ 24,60' |
        | 2    | 'R$ 11,20' |

  Cenario: Remover todos os itens
    Dado que os produtos adicionados são
      | nome                   | preco    | quantidade |
      | Cup Cake               | R$ 8,70  | 1          |
      | Donut                  | R$ 2,50  | 1          |
      | Pão Artesanal Italiano | R$ 15,90 | 1          |
    Quando o usuario remove todos os itens 
    Entao a seguinte mensagem sera apresentada 'Seu carrinho está vazio!'  

@remove
  Cenario: Limpar carrinho
    Dado que os produtos adicionados são
      | nome                   | preco    | quantidade |
      | Cup Cake               | R$ 8,70  | 1          |
      | Donut                  | R$ 2,50  | 1          |
      | Pão Artesanal Italiano | R$ 15,90 | 1          |
    Quando o usuario limpa o carrinho
    Entao a seguinte mensagem sera apresentada 'Seu carrinho está vazio!'  

@frete
    Cenario: Validar valor total e frete
    Dado que os produtos adicionados são
      | nome                   | preco    | quantidade |
      | Cup Cake               | R$ 8,70  | 1          |
      | Donut                  | R$ 2,50  | 1          |
      | Pão Artesanal Italiano | R$ 15,90 | 1          |
    Quando o adiciona itens ao carrinho
    Entao o valor total dos itens deverá ser 'R$ 27,10'
    E o valor do frete deve ser igual a 'R$ 8,00'
    E o valor do carrinho deve ser igual a 'R$ 35,10'