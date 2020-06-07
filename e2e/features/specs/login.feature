# language: pt
@login
Funcionalidade: Login
    Sendo usuário cadastrado
    Posso efetuar login
    Para gerenciar minha conta

@loginSucesso @principal
Cenario: Login de usuário válido
  Dado que estou na tela de login
  Quando e preencho 'email' e 'senha' com dados 'corretos'
  Entao o login é efetuado com sucesso

@loginFalha
Esquema do Cenario: Login de usuário válido
  Dado que estou na tela de login
  Quando e preencho <email> e <senha> com dados 'incorretos'
  Entao é exibida a <mensagem> de erros

  Exemplos:
  | email                     | senha        | mensagem                    |
  | 'email@naocadastrado.com' | '1234566789' | 'Email ou senha inválidos.' |
  | 'anderson@youse'          | 'teste123'   | 'Email ou senha inválidos.' |
  | 'anderson@youse'          | ''           | 'Email ou senha inválidos.' |

@logout @loginSuccess
Cenario: Logout
  Dado que estou logado
  Quando clicar em logout
  Entao sou deslogado



