Dado("que estou na tela de login") do
    @HomePage.url
    @HomePage.clickMyAccount
end

Quando("e preencho {string} e {string} com dados {string}") do |email, senha, tipo|
    @LoginPage.login(email, senha, tipo)
end

Entao("o login é efetuado com sucesso") do
    expect(@RegisterPage.assertAlert).to eq 'Login efetuado com sucesso.'
end

Entao("é exibida a {string} de erros") do |mensagem|
    expect(@LoginPage.alertError).to eq mensagem
end
                                                                                                                                   