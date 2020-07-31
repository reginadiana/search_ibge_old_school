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
    header.avalible_ufs
    ufs.each do |uf|
      puts "#{uf[1]}\t | #{uf[4].split[0]} \t| #{uf[3]} \t| #{uf[2]}  "
    end
  end

  def show_avalible_decades
    decades = db.execute(sql.query_all_decades)
    header.avalible_decades
    decades.each do |decade|
      puts "#{decade[0]} | #{decade[1]}"
    end
    puts "\n"
  end

  private

  def header
    Header.new
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
