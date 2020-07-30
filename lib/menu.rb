# frozen_string_literal: true

# Show messages to menu
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
