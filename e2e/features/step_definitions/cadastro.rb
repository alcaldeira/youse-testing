Dado("que estou na tela de cadastro") do
  @HomePage.url
  @HomePage.clickMyAccount
  expect(@LoginPage.assertTitleLogin).to eq "Faça seu login para acessar sua conta Youse."
  @LoginPage.clickCreateAccount
end

Quando("preencho os campos {string}, {string} e {string} com sucesso {string}") do |name, email, password, type|
  @RegisterPage.createAccount(type ,name, email, password)
end

Entao("o cadastro é realizado com sucesso") do
  expect(@RegisterPage.assertAlert).to eq "Bem vindo! Você realizou seu registro com sucesso."
end

Entao("é exibida a {string} de erro") do |mensagem|
  expect(page).to have_content (mensagem)
end