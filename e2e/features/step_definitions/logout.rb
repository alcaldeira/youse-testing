Dado("que estou logado") do
    # SOMENTE PARA CONTEXTO
end

Quando("clicar em logout") do
    @LoginPage.logout
end

Entao("sou deslogado") do
    expect(page.current_url).to eq 'https://www.youse.com.br/'
end