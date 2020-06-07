Dado("que estou na página inicial") do
    @HomePage.url
end

Dado("que estou na página de simulação de seguro auto") do
    @HomePage.url
    @HomePage.clickProduct('auto')
end

# Quando("preencher dados da simulação") do
#    @AutoQuote.newOrder
#    @AutoQuote.about
#    @AutoQuote.hasVehicle
#    @AutoQuote.vehicleData
#    @AutoQuote.address
#    @AutoQuote.insuredData
#    @AutoQuote.selectPlan
# end

Quando("preencher dados da simulação com {string}") do |placa|
    @AutoQuote.newOrder
    @AutoQuote.about
    @AutoQuote.hasVehicle(placa)
    @AutoQuote.address
    @AutoQuote.insuredData
    @AutoQuote.selectPlan
end

Então("vejo a página com resultado do seguro contratado") do
    expect(@AutoQuote.title). to eq 'Pronto, agora seu seguro está completo!'
end

Então("a mensagem de erro {string}") do |mensagem|
    expect(@AutoQuote.modalError).to eq(mensagem)
end

Quando("clicar no {string}") do |produto|
    @HomePage.clickProduct(produto)
end

Então("sou direcionado para {string}") do |url|
    expect(page.current_url).to eq url
end