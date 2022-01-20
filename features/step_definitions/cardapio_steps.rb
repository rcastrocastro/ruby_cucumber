Então('os itens do cardapio serao apresentados') do |table|
  itens = @page.call(RestaurantePage).menu
  prod_data = table.hashes # tabela em coluna
  prod_data.each_with_index do |value, index|
    expect(itens[index]).to have_text value['produto'].upcase
    expect(itens[index]).to have_text value['descricao']
    expect(itens[index]).to have_text value['preco']
  end    
end

Então('as informacoes adicionais serao apresentadas') do |table|
  infos = table.rows_hash # tabela em linha (rows)
  detail = @page.call(RestaurantePage).details
  expect(detail).to have_content infos['categoria']
  expect(detail).to have_content infos['decricao']
  expect(detail).to have_content infos['horarios']
end