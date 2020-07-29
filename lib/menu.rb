# frozen_string_literal: true

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
      decorate(60)
      common_names(input.insert_uf, sql.query_info_federatives)
    elsif option == COMMON_NAMES_IN_COUNTY
      decorate(60)
      common_names(input.insert_county, sql.query_info_counties)
    elsif option == FREQUENTY_NAMES
      show_avalible_decades
      api.call_frequence_names(input.insert_names)
    else option == MOST_USED_DECADE
      show_avalible_decades
      api.call_most_used_by_decade(input.insert_decade)
    end
  end

  def common_names(region, query)
    response = sql.call_query(region, query, db)
    return search_not_found unless response

    puts "Dados para a região de: #{response[2]}".yellow
    puts "População total: #{response[3]}".yellow
    api.call_most_used(response[1], response[3])
  end

  def show_avalible_ufs
    ufs = db.execute(sql.query_all_federatives)
    decorate(29)
    puts "Código | População | Estado |"
    decorate(29)
    ufs.each do |uf|
      puts "#{uf[1]}\t | #{uf[3]} \t| #{uf[2]}"
    end
  end

  def show_avalible_decades
    decades = db.execute(sql.query_all_decades)
    decorate(35)
    puts 'Década/Ano | Número de Habitantes |'.yellow
    decorate(35)
    decades.each do |decade|
      puts "#{decade[0]} | #{decade[1]}"
    end
    puts "\n"
  end

  def call_population(decade)
    sql.call_query(decade, sql.query_some_population_by_decade, db)[0]
  end

  def search_not_found
    puts 'Não foi possível encontrar os dados'.red
    puts 'Por favor, digite um código ou nome válidos'.red
  end

  def check_invalidation_option(option)
    return unless option.negative? || option > 4

    puts "\nPor favor, digite uma opção válida\n".red
    true
  end

  def decorate(amount)
    puts '-' * amount
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

end
