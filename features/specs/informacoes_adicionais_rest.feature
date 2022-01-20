#language: pt

Funcionalidade: Informacoes adicionais
  Para que o usuario consiga ver as informacoes adicionais
  Sendo que escolheu o restaurante
  Possa ver a categoria, descricao detalhada e horario de funcionamento

  Contexto: Restaurantes
    Dado que o usuario acesse a lista de restaurantes

@det
  Cenario: Detalhes do restaurante
    Quando escolho o restaurante 'Burger House'
    Então as informacoes adicionais serao apresentadas
      | categoria | Hamburgers                               | 
      | descricao | 40 anos se especializando em trash food. |
      | horarios  | Funciona todos os dias, de 10h às 22h    |
      
