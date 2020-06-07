##Pré-Requisitos##

*Intalação do Ruby - Versão 2.5 ou superior
Bibliotecas principais do projeto, já existentes no Gemfile
Driver *Chromedriver

**Instalando as bibliotecas**
 bundle install

## TAGS Para executar os planos isoladamente:

**e2e - acessar a pasta /e2e**
@cadastro **Executa a feature inteira de cadastro**
@cadastroSucesso
@cadastroIncorreto
@login **Executa a feature inteira de login**
@loginSucesso
@loginFalha
@logout
@simulacao **Executa a feature inteira de simulação**
@simulacaoComPlaca
@simulacaoSemPlaca
@validacaoUrl

cucumber -t @principal **Executa os principais cenários de cada funcionalidade**

**serviços - acessar a pasta /services**
@personagens **Executa a feature inteira**
@filtroLimite
@filtroPersonagem
@filtroComics

## Exemplo:
cucumber --tag @loginSucesso

## Para executar todo o projeto executar (acessar pasta e2e ou services)
cucumber


