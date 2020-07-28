# frozen_string_literal: true

require 'colorize'
require 'sqlite3'
require_relative 'sql'
require_relative 'api'
require_relative 'input'

# Options
EXIT = 0
COMMON_NAMES_IN_UF = 1
COMMON_NAMES_IN_COUNTY = 2
FREQUENTY_NAMES = 3
MOST_USED_DECADE = 4

# Show options to user
class Menu

  def welcome
    puts 'Bem-vindo a plataforma de pesquisa de nomes IBGE!'.green
  end

  def show
    print "\nMenu:\n".yellow
    puts "[#{COMMON_NAMES_IN_UF}] Ver nomes mais comuns de uma Unidade Federativa (UF)".yellow
    puts "[#{COMMON_NAMES_IN_COUNTY}] Ver nomes mais comuns de um municipio".yellow
    puts "[#{FREQUENTY_NAMES}] Ver frequência de um nome ao longo dos anos".yellow
    puts "[#{MOST_USED_DECADE}] Ver nomes mais usados em uma década".yellow
    puts "[#{EXIT}] Sair".yellow

    print 'Escolha uma opção: '
    input.read_number
  end

  def response_consult(option)
    if option == COMMON_NAMES_IN_UF
      show_avalible_ufs
      decorate
      common_names(input.insert_uf, sql.query_info_federatives)
    elsif option == COMMON_NAMES_IN_COUNTY
      decorate
      common_names(input.insert_county, sql.query_info_counties)
    else option == FREQUENTY_NAMES
      api.call_frequence_names(input.insert_names)
    end
  end

  def common_names(region, query)
    response = sql.call_query(region, query, db)
    
    puts "Dados para a região de: #{response[2]}".yellow
    puts "População total: #{response[3]}".yellow
    api.call_most_used(response[1], response[3])
  end

  def show_avalible_ufs
    ufs = db.execute(sql.query_all_federatives)
    puts "Código - Estado - População"
    ufs.each do |uf|
      puts "#{uf[1]} - #{uf[2]} - #{uf[3]}"
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
  
  private

  def db
    SQLite3::Database.open 'db/database.db'
  end

  def sql
    Sql.new
  end

  def api
    API.new
  end

  def input
    Input.new
  end

  def decorate
    puts '-' * 60
  end
end
