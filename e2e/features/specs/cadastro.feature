# language: pt
@cadastro
Funcionalidade: Realizar Testes de Cadastro de Novos Usuários

@cadastroSucesso @principal
Cenario: Cadastro com sucesso
  Dado que estou na tela de cadastro
  Quando preencho os campos 'name', 'email' e 'senha' com sucesso 'sucesso'
  Entao o cadastro é realizado com sucesso

@cadastroIncorreto
Esquema do Cenario: Cadastro com sucesso
  Dado que estou na tela de cadastro
  Quando preencho os campos <name>, <email> e <senha> com sucesso 'falha'
  Entao é exibida a <mensage> de erro
  
  Exemplos:
  | name              | email                    |senha      | mensage                    |
  | ''                | 'nomeembranco@youse.com' |'10102020' | 'não pode ficar em branco' |
  | 'Email em branco' | ''                       |'10102020' | 'não pode ficar em branco' |
  | 'Senha em Branco' | 'youse@youse.com'        |''         | 'não pode ficar em branco' |
