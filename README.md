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

:pushpin: Consultas na [API]()

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

:books: &nbsp; [**Faker**](https://github.com/faker-ruby/faker/blob/master/doc/default/address.md) para gerar nomes de municipios e Uf's aleatórios nos testes.

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

<p align="center">
  <img src="https://user-images.githubusercontent.com/46378210/88745332-29488a80-d120-11ea-8cee-7285689fd5c2.png" width="600" alt="Menu de Pesquisa"/>
</p>

1. Acesse o menu e escolha uma opção. 

2. Se escolher a **opção 1**, uma tabela com os estados é mostrada e após **digitar um código ou nome do estado**, um ranking com os nomes aparecem.

| ![](https://user-images.githubusercontent.com/46378210/88746305-a37a0e80-d122-11ea-92f8-51c07324961e.png) | ![](https://user-images.githubusercontent.com/46378210/88746288-99581000-d122-11ea-8fb0-6d57027ed488.png) |
| :-----: | :-----:  |

3. Para a **opção 2**, o processo é semelhante, porém os dados dependem no **nome do municipio e do estado em parenteses**. 

<p align="center">
  <img src="https://user-images.githubusercontent.com/46378210/88746323-abd24980-d122-11ea-980b-71e474e3ed5c.png" width="500" alt="Menu de Pesquisa"/>
</p>

4. Para a **opção 3**, é necessário escrever um ou mais nomes separados por vírgula, retornando um tabela com o histórico da frequencia daquele nome entre os anos 30 e 2010. 

<p align="center">
  <img src="https://user-images.githubusercontent.com/46378210/88746342-b4c31b00-d122-11ea-8fc6-a741f6ca3704.png" width="500" alt="Menu de Pesquisa"/>
</p>

5. Para a **opção 4**, é necessário digitar um ano entre 30 e 2010, retornando os nomes femininos e masculinos mais usados. 

<p align="center">
  <img src="https://user-images.githubusercontent.com/46378210/88746348-b8ef3880-d122-11ea-8548-f5509e726b0f.png" width="500" alt="Menu de Pesquisa"/>
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

