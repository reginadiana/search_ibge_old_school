<p align="center">
  <img src="" alt="Logo"/>
</p>

<p align="center">
  <img src="https://img.shields.io/apm/l/vim-mode?color=green&label=license&logo=license&logoColor=green&style=for-the-badge"/>
  <img src="http://img.shields.io/static/v1?label=Ruby&message=2.6.3&color=red&style=for-the-badge&logo=ruby"/>
  <img src="http://img.shields.io/static/v1?label=STATUS&message=progress&color=orange&style=for-the-badge">
</p>

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
    
</p>

## Gems instaladas

:books: &nbsp; [**Sqlite**](https://rubygems.org/gems/pg/versions/0.18.4?locale=pt-BR) para construir o banco de dados 

:books: &nbsp; [**RSpec**](https://github.com/rspec/rspec-rails) para escrever e executar testes unitários, isto é, de baixo nível 

:books: &nbsp; [**Rubocop**](https://github.com/rubocop-hq/rubocop) para verificar a formatação do código, analisando o uso correto de identação, uso de aspas duplas e simples, espaços e linhas desnecessárias, etc.

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
$ ruby lib/search.rb
```

## Como pesquisar pelos dados :mag_right:

<p align="center">
  <img src="" width="600" alt="Menu de Pesquisa"/>
</p>

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

