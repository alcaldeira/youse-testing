# language: pt

@simulacao
Funcionalidade: Simulação seguro
    Sendo um visitante do site
    Posso efetuar uma simulação de seguro
    Para contratar

@simulacaoComPlaca @principal
Cenário: Simular seguro sem ter o veiculo
    Dado que estou na página de simulação de seguro auto
    Quando preencher dados da simulação com "EKP-8193"
    Então vejo a página com resultado do seguro contratado

@simulacaoSemPlaca
Cenário: Simular seguro sem ter o veiculo
    Dado que estou na página de simulação de seguro auto
    Quando preencher dados da simulação com "XXX-0000"
    Então a mensagem de erro "Ops! Ainda não tem a placa do veículo?"

@validacaoUrl
Esquema do Cenário: Validar pagina seleciona
    Dado que estou na página inicial
    Quando clicar no <produto>
    Então sou direcionado para <pagina>

    Exemplos:
    | produto       | pagina                                         |
    | 'auto'        | 'https://www.youse.com.br/seguro-auto/'        |
    | 'residencial' | 'https://www.youse.com.br/seguro-residencial/' | 
    | 'vida'        | 'https://www.youse.com.br/seguro-de-vida/'     |


