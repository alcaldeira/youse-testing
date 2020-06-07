# language: pt

@personagens
Funcionalidade: Marvel
  Como usuário cadastrado
  Posso listar persornagens

@filtroLimite
Cenário: Filtrar limite de personagens
  Dado que tenho acesso a URI
  Quando filtrar por 5 personagens
  Então é retornado os dados dos personagens

@filtroPersonagem
Cenário: Listar único personagem da Marvel
  Dado que tenho acesso a URI
  Quando buscar por pelo id "1009146"
  Então é exibido o nome do personagem 'Abomination (Emil Blonsky)'

@filtroComics
Cenário: Listar comics de único personagem da Marvel
  Dado que tenho acesso a URI
  Quando buscar as comics de um único personagem
  Então devo visualizar as comics do personagem