<p align="center">
  <img src="https://user-images.githubusercontent.com/46378210/88458218-e6a65a00-ce62-11ea-96c2-c5f6faa2dd0a.png" alt="Logo"/>
</p>

<p align="center">
  <img src="https://img.shields.io/apm/l/vim-mode?color=green&label=license&logo=license&logoColor=green&style=for-the-badge"/>
  <img src="http://img.shields.io/static/v1?label=Ruby&message=2.6.3&color=red&style=for-the-badge&logo=ruby"/>
  <img src="http://img.shields.io/static/v1?label=STATUS&message=progress&color=orange&style=for-the-badge">
</p>

:memo: [**TASKS (Kanban)**](https://github.com/reginadiana/search_ibge_old_school/projects/1">Tasks)

<hr>

## Tópicos

:small_orange_diamond: &nbsp; [Descrição do Projeto](#descrição-do-projeto)

:small_orange_diamond: &nbsp; [Gems instaladas](#gems-instaladas)

:small_orange_diamond: &nbsp; [Pré-Requisitos](#pré-requisitos-package) 

:small_orange_diamond: &nbsp; [Configurações](#configurações)

:small_orange_diamond: &nbsp; [Como pesquisar pelos dados](#como-pesquisar-pelos-dados-mag_right)

:small_orange_diamond: &nbsp; [Executando os testes](#executando-os-testes-memo) 

:small_orange_diamond: &nbsp; [Licença](#licença-trident)

## Descrição do Projeto

<p align="justify">
  O projeto desenvolvido foi baseado na aplicação <a href="https://censo2010.ibge.gov.br/nomes/#/search/response/235)">Nomes do Brasil</a>, para consultar, a partir de um nome e sexo (opcional), a frenquencia de uso de um nome e ver gráficamente a porcentagem que ele representa em cada um dos estados do Brasil. 
  
  A proposta **desta** aplicação é ampliar as possíbilidades de pesquisa, sendo possível:
  
:bar_chart: A partir de uma **UF**, encontrar um ranking **(top 20)** com os nomes mais usadados para os sexos feminino, masculino e ambos.

:bar_chart: Idem ao tópico 1, pesquisando a partir de um **municipio**. 

:bar_chart: A partir de um nome, exibir uma tabela com a frequencia com que o nome foi usado ao longo de décadas. 

:bar_chart: Em todas as tabelas de pesquisa, mostrar uma coluna o percentual que um nome representa em relação a população total de uma UF ou municipio. 

:bar_chart: **Pesquisa bonus** Mostrar um ranking com os nomes que mais usados em alguma década.
</p>

## Principais tasks do projeto

:pushpin: Consultas na [API](https://servicodados.ibge.gov.br/api/docs/censos/nomes?versao=2#:~:text=A%20API%20distingue%20nomes%20diferenciados,Antonio%20s%C3%A3o%20contabilizados%20como%20Antonio.)

:pushpin: Manipulação de arquivos csv e banco de dados 

:pushpin: Lógica para tratar dos dados entre API e arquivos csv

:pushpin: Organização do código

:pushpin: TDD

:pushpin: Criação de menus interativos, pensando em usabilidade e entrega de valor

## Gems instaladas

:books: &nbsp; [**Sqlite**](https://rubygems.org/gems/pg/versions/0.18.4?locale=pt-BR) para construir o banco de dados 

:books: &nbsp; [**RSpec**](https://github.com/rspec/rspec-rails) para escrever e executar testes unitários, isto é, de baixo nível 

:books: &nbsp; [**Rubocop**](https://github.com/rubocop-hq/rubocop) para verificar a formatação do código, analisando o uso correto de identação, uso de aspas duplas e simples, espaços e linhas desnecessárias, etc.

:books: &nbsp; [**Colorize**](https://github.com/fazibear/colorize) para deixar o menu mais intuitivo e melhorar a usabilidade. 


## Pré-Requisitos :package:

Algumas dependencias devem ser instaladas antes de configurar o projeto:

:warning: &nbsp; [Ruby](https://www.ruby-lang.org/pt/documentation/installation/) versão >=2.6.3

:warning: &nbsp; [Gem](https://rubygems.org/pages/download?locale=pt-BR) versão >=3.1.2

:warning: &nbsp; [Bundle](https://bundler.io/man/bundle-install.1.html) versão >=2.1.2

Para checar a versão, execute:
```
$ <nome da dependencia> -v
```
## Configurações

No terminal, clone este projeto:
```
$ git clone https://github.com/reginadiana/search_ibge_old_school
```
Acesse a pasta:
```
$ cd search_ibge_old_school
```
Instale as dependencias e prepare o banco de dados:
```
$ bin/setup
```
Para abrir o menu:
```
$ ruby lib/index.rb
```

## Como pesquisar pelos dados :mag_right:

Clique [aqui] para saber como fazer as pesquisas :smile:

## Executando os testes :memo:

```ruby
$ cd search_ibge_old_school
$ rspec 
```

## Licença :trident:

The [MIT License](https://github.com/reginadiana/search_ibge_old_school/blob/master/LICENSE) (MIT)

Copyright :copyright: 2020 SEARCH IBGE
<br/>
<img src="https://badges.frapsoft.com/os/v1/open-source.svg?v=102"/>

