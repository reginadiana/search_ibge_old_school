# frozen_string_literal: true

# Show messages to menu
class Menu
  def welcome
    puts 'Bem-vindo a plataforma de pesquisa de nomes IBGE!'.colorize(color: :black, background: :green)
    puts 'Digite um número correspondente às opções!'
  end

  def show
    print "\nMenu:\n".yellow
    options
    input.choice_option
  end

  def options
    puts "[#{COMMON_NAMES_UF}] Consultar nomes mais comuns de uma UF".yellow
    puts "[#{COMMON_NAMES_COUNTY}] Consultar nomes mais comuns de um municipio".yellow
    puts "[#{FREQUENTY_NAMES}] Consultar a frequência de um nome ao longo dos anos".yellow
    puts "[#{MOST_USED_DECADE}] Consultar os nomes mais usados em uma década".yellow
    puts "[#{SHOW_UFS}] Ver UF's disponíveis".light_blue
    puts "[#{SHOW_DECADES}] Ver decadas disponíveis".light_blue
    puts "[#{EXIT}] Sair".yellow
  end

  def show_avalible_ufs
    ufs = db.execute(sql.query_all_federatives)
    header_avalible_ufs
    ufs.each do |uf|
      puts "#{uf[1]}\t | #{uf[4].split[0]} \t| #{uf[3]} \t| #{uf[2]}  "
    end
  end

  def show_avalible_decades
    decades = db.execute(sql.query_all_decades)
    header_avalible_decades
    decades.each do |decade|
      puts "#{decade[0]} | #{decade[1]}"
    end
    puts "\n"
  end

  def decorate(amount)
    puts '-' * amount
  end

  def header_option(state, population)
    puts "O estado escolhido foi #{state}. Você sabia que a população é de #{population} de habitantes?"
      .light_blue
  end

  def header_option_decade(decade, population)
    puts "A decada escolhida foi #{decade}. \nVocê sabia que naquela época a população era de #{population} de habitantes?"
      .light_blue
    puts 'Quem sabe a gente não encontra os nomes dos seus avós nessas listas?'
      .light_blue
  end

  private

  def header_avalible_ufs
    decorate(37)
    puts 'Código | Sigla | População | Estado |'
    decorate(37)
  end

  def header_avalible_decades
    decorate(35)
    puts 'Década/Ano | Número de Habitantes |'.yellow
    decorate(35)
  end

  def input
    Input.new
  end

  def db
    SQLite3::Database.open 'db/database.db'
  end

  def sql
    Sql.new
  end
end
