Dado("que tenho acesso a URI") do
  @marvel = MarvelChacarters.new
end

Quando("buscar as comics de um único personagem") do
  @marvel.getComics
end

Quando("buscar por pelo id {string}") do |id|
  @marvel_personagem_id = @marvel.getCharacterId(id)
end

Quando('filtrar por 5 personagens') do
  @marvel.getLimitCharacter
end

Então("é retornado os dados dos personagens") do
  personagens = @marvel.assertLimistCharacter(@marvel.getLimitCharacter.parsed_response)
  expect(@marvel.getLimitCharacter.code).to be(200)
end

Então('é exibido o nome do personagem {string}') do |nome|
  json = @marvel_personagem_id.parsed_response
  expect(json["data"]["results"][0]["name"]).to eq(nome)
  expect(@marvel_personagem_id.code).to be(200)
end

Então("devo visualizar as comics do personagem") do
  comics = @marvel.expectComics(@marvel.getComics.parsed_response)
  expect(@marvel.getComics.code).to be(200)
end



