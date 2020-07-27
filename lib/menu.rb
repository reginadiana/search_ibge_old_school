# frozen_string_literal: true

require 'colorize'
require 'sqlite3'
require_relative 'sql'
require_relative 'api'

# Options
EXIT = 0
COMMON_NAMES_IN_UF = 1
COMMON_NAMES_IN_COUNTY = 2
FREQUETY_NAMES = 3
MOST_USED_DECADE = 4

# Menu e tratamento dos dados digitados pelo usuario
class Menu

  def welcome
    puts 'Bem-vindo a plataforma de pesquisa de nomes IBGE!'.green
  end

  def show
    print "\nMenu:\n".yellow
    puts "[#{COMMON_NAMES_IN_UF}] Ver nomes mais comuns de uma Unidade Federativa (UF)".yellow
    puts "[#{COMMON_NAMES_IN_COUNTY}] Ver nomes mais comuns de um municipio".yellow
    puts "[#{FREQUETY_NAMES}] Ver frequência de um nome ao longo dos anos".yellow
    puts "[#{MOST_USED_DECADE}] Ver nomes mais usados em uma década".yellow
    puts "[#{EXIT}] Sair".yellow

    print 'Escolha uma opção: '
    read_number
  end

  def response_consult(option)
    return unless option == COMMON_NAMES_IN_UF

    show_avalible_ufs
    decorate
    response = sql.call_query(insert_uf, sql.query_info_federatives, db)
    
    puts "Dados para o estado de: #{response[2]}".yellow
    api.most_used_female(response[1])

    return unless option == FREQUETY_NAMES

    insert_names
  end

  def show_avalible_ufs
    ufs = db.execute(sql.query_all_federatives)
    puts "Código - Estado - População"
    ufs.each do |uf|
      puts "#{uf[1]} - #{uf[2]} - #{uf[3]}"
    end
  end

  def insert_uf
    print 'Digite o código da UF:'
    read_input
  end

  def insert_county
    print 'Digite o código do Municipio:'
    read_input
  end

  def insert_names
    print "Digite um nome ou vários separados por vírgulas, exemplo:\n"
    print "Para um nome, digite: Diana\n"
    print "Para vários nomes, digite: Diana, João, Camilo, Luiz\n"
    separate_names(read_input)
  end

  def separate_names(input)
    names = input.split(',')
    names.each do |name|
      puts name.split(' ')
    end
  end

  def search_not_found
    puts 'Não foi possível encontrar os dados, digite um código ou nome válidos'.red
  end

  def check_invalidation_option(option)
    return unless option.negative? || option > 4

    puts "\nPor favor, digite uma opção válida\n".red
    true
  end

  def clear
    system('clear')
    puts
  end

  def read_input
    gets.chomp
  end

  def read_number
    gets.to_i
  end
  
  private

  def api
    API.new
  end

  def sql
    Sql.new
  end

  def db
    SQLite3::Database.open 'db/database.db'
  end

  def decorate
    puts '-' * 60
  end
end
