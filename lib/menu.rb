# frozen_string_literal: true

# Options
EXIT = 0
COMMON_NAMES_UF = 1
COMMON_NAMES_COUNTY = 2
FREQUENTY_NAMES = 3
MOST_USED_DECADE = 4
SHOW_UFS = 5
SHOW_DECADES = 6

# Show options to user
class Menu
  def welcome
    puts 'Bem-vindo a plataforma de pesquisa de nomes IBGE!'.green
  end

  def show
    print "\nMenu:\n".yellow
    options
    input.choice_option
  end

  def options
    puts "[#{COMMON_NAMES_UF}] Nomes mais comuns de uma UF".yellow
    puts "[#{COMMON_NAMES_COUNTY}] Nomes mais comuns de um municipio".yellow
    puts "[#{FREQUENTY_NAMES}] Frequência de um nome ao longo dos anos".yellow
    puts "[#{MOST_USED_DECADE}] Nomes mais usados em uma década".yellow
    puts "[#{SHOW_UFS}] Ver UF's disponíveis".yellow
    puts "[#{SHOW_DECADES}] Decadas disponíveis".yellow
    puts "[#{EXIT}] Sair".yellow
  end

  def response_consult(option)
    to_common_names(option)
    to_frequence_names(option)
    to_show_info(option)
  end

  def to_common_names(option)
    if option == COMMON_NAMES_UF
      common_names(input.insert_uf, sql.query_info_federatives)
    elsif option == COMMON_NAMES_COUNTY
      common_names(input.insert_county, sql.query_info_counties)
    end
  end

  def to_frequence_names(option)
    if option == FREQUENTY_NAMES
      api.call_frequence_names(input.insert_names)
    elsif option == MOST_USED_DECADE
      api.call_most_used_by_decade(input.insert_decade)
    end
  end

  def to_show_info(option)
    if option == SHOW_UFS
      show_avalible_ufs
    elsif option == SHOW_DECADES
      show_avalible_decades
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
    decorate(37)
    puts 'Código | Sigla | População | Estado |'
    decorate(37)
    ufs.each do |uf|
      puts "#{uf[1]}\t | #{uf[4].split[0]} \t| #{uf[3]} \t| #{uf[2]}  "
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
  end

  def check_invalidation_option(option)
    return unless option.negative? || option > 6

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
    Api.new
  end

  def input
    Input.new
  end
end
